#!/bin/bash
# Written by Braeden Smith -- if lost please email braedensmith2 at gmail d0t com

# Built to update my flashdrive full of programs
clear
declare -a directories=( "Maintenance" "MalwareRemoval" "Programs" )
declare -a Maintenance=( "")
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
wget -q -O - https://www.piriform.com/ccleaner/download/standard | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' | grep '^http://download.piriform.com\|\.exe$' | sed -n 1p | wget -q -i -
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
# echo "Downloading Rkill..."
# wget -q http://download.bleepingcomputer.com/dl/0256e27336dafbafd51c5163362b8124/5619dabd/windows/security/security-utilities/r/rkill/rkill.exe
# Not sure if it has a unique token that needs to be cycled 
# echo "DONE"
# echo ""
# echo "Downloading ComboFix..."
# wget -q http://download.bleepingcomputer.com/dl/267870605aed203e2bbfc5b050be7323/5619db5f/windows/security/anti-virus/c/combofix/ComboFix.exe
# echo "DONE"
# echo ""

cd ..

cd Programs

echo "Downloading chrome..."
wget -q http://dl.google.com/chrome/install/149.27/chrome_installer.exe
echo "DONE"
echo ""
echo "Downloading sublime..."
wget -q -O - http://www.sublimetext.com/2 | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' | grep 'x64\ Setup\.exe$' | sed -n 1p | wget -q -i -
echo "DONE"
echo ""

cd ..


echo "--End Update--"