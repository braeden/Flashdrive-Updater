#!/bin/bash
# Written by Braeden Smith -- if lost please email braedensmith2 at gmail d0t com

# Built to update my flashdrive full of programs
clear
declare -a directories=( "Maintenance" "MalwareRemoval" "Programs" )
echo "--Begin Update--"
for i in "${directories[@]}"
do
echo ""
	if [ -d $i ]; then
		echo "Deleting '$i'..."
		rm -r $i;
	fi
echo "Creating '$i'..."
mkdir $i
done
echo "-------------------"
cd Maintenance

echo "Downloading ccleaner..."
curl -s -J -O http://www.piriform.com/ccleaner/download/slim/downloadfile
# Thanks /u/Synapse84
echo "DONE"
echo ""

cd ..

# This is an abomination... 
# thanks greg - http://stackoverflow.com/users/123109/greg-bacon
# Could probally be condensed - no easy link due to the version changes
cd MalwareRemoval

echo "Downloading malwarebytes..."
wget -q https://downloads.malwarebytes.org/file/mbam_current/ -O lastestMalwarebytes.exe
echo "DONE"
echo ""
echo "Downloading Rkill..."
wget -q -O - http://www.bleepingcomputer.com/download/rkill/dl/10/ | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' | grep '^http\:\/\/download\.bleepingcomputer\.com\/dl.*rkill\.exe$' | wget -q -i -
echo "DONE"
echo ""
echo "Downloading ComboFix..."
wget -q -O - http://www.bleepingcomputer.com/download/combofix/dl/12/ | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' | grep '^http\:\/\/download\.bleepingcomputer\.com\/dl.*ComboFix\.exe$' | wget -q -i -
echo "DONE"
echo ""
echo "Downloading KDSSKiller"
wget -q http://support.kaspersky.com/downloads/utils/tdsskiller.exe
echo "DONE"
echo ""
cd ..

cd Programs

echo "Downloading chrome..."
wget -q http://dl.google.com/chrome/install/149.27/chrome_installer.exe
echo "DONE"
echo ""
echo "Downloading chrome cleanup"
wget -q https://dl.google.com/dl/softwareremovaltool/win/chrome_cleanup_tool.exe
echo "DONE"
echo ""
echo "Downloading sublime..."
wget -q -O - http://www.sublimetext.com/2 | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' | grep 'x64\ Setup\.exe$' | sed -n 1p | wget -q -i -
echo "DONE"
echo ""

cd ..


echo "--End Update--"
