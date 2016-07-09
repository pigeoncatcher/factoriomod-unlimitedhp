#!/bin/sh

# USAGE:
# ./testInGame.sh [versionNumber]
# ./testInGame.sh 0.0.5

name="00 Unlimited HP"



if [ -z "$1" ]                      
then

	echo
	echo "  !!  no versionNumber  !!"
	echo
	echo "USAGE:"
	echo "./testInGame.sh [versionNumber]"
	echo "example:"
	echo "./testInGame.sh 0.0.5"
	echo

else
	echo
	echo " --------         -------- "
	echo " -------- running -------- "
	echo " --------         -------- "
	echo
	echo "      testInGame.sh"
	echo
	echo " ----- "$name"_"$1" ----- "
	echo

	
	cd ~/facdev/factoriomod-unlimitedhp/
	# rename directory
	mv "$name"* "$name"_"$1"
	# change version in info.json
	regexversionnumber="\([0-9]\+\.\)\?\([0-9]\+\.\)\?\([0-9]\+\)"
	sed -i 's/\"version\": \"'$regexversionnumber'\",/\"version\": \"'$1'\",/' "$name"_"$1"/info.json

	# remove prevous test
	rm ~/.factorio/mods/"$name"*
	zip -Jr ~/.factorio/mods/"$name"_"$1".zip "$name"_"$1"/

fi



