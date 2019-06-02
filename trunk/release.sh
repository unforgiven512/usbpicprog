#!/usr/bin/env bash


if [ $# -ne 0 ]; then
	RELEASE=$1
else
	RELEASE=$(date +%Y%m%d)
	RELEASE=${RELEASE:0:6}
fi

echo "Building release: $RELEASE"

if [ -d release ]; then
	echo -e "Directory \033[1mrelease\033[0m exists, removing..."
	rm -rf release
fi

echo -e "Making release directories \033[1mrelease/usbpicprog\033[0m and \033[1mrelease/firmware\033[0m for build..."
mkdir release


echo "exporting git tree..."
git clone ../ release/

mkdir "release/usbpicprog"
mkdir "release/firmware"
mv "release/trunk/upp_wx" "release/usbpicprog/usbpicprog-$RELEASE"
mv "release/trunk/uc_code" "release/firmware/firmware-$RELEASE"
mv "release/trunk/boot" "release/firmware/boot1.0"
rm -r "release/trunk"
rm -r "release/README.md"
rm -rf "release/.git"

echo -e "copying \033[1m*.hex\033[0m files..."
cp "release/firmware/firmware-$RELEASE/uc_code.hex" "release/firmware/firmware-$RELEASE.hex"
cp "release/firmware/boot1.0/Boot.hex" "release/firmware/boot1.0.hex"

echo "making firmware zip archive..."
cd "release/firmware"
zip -9 -r "firmware-$RELEASE.zip" *
mv "firmware-$RELEASE.zip" "../"
cd ..

echo "creating autogen files..."
cd "usbpicprog/usbpicprog-$RELEASE"

./autogen.sh

cp "po/*.mo" "../"

# Run a make distclean to ensure we are starting fresh...
make distclean

echo "restoring language files..."
mv "../*.mo" "po/"
rm -rf m4
rm -rf autom4te.cache

if [  ${RELEASE:0:2} = "0."  ]; then
	(echo '// generated file'; echo '#define UPP_VERSION "usbpicprog '$RELEASE'"';) > svn_revision.h;
else
	(echo '// generated file'; echo '#define SVN_REVISION "usbpicprog '$RELEASE'"';) > svn_revision.h;
fi

cd ..

echo "creating source archive..."
tar -zcvhf "usbpicprog-$RELEASE.tar.gz" "usbpicprog-$RELEASE"
mv "usbpicprog-$RELEASE.tar.gz" "../"

cd ..
rm -rf firmware
rm -rf usbpicprog

echo -e "\n\n\033[33;1m--- FINISHED ---\033[0m\n\n"

