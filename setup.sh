#!/bin/bash

promptBool () {
	read -p "$1" input

	if [[ $input == "$2" ]]; then 
		return 1 
	fi

	return 0
}

printInfo () {
	echo -e "$(echoColor $cyan "\n>  $1")"
}

echoBold () {
	bold=$(tput bold)
	normal=$(tput sgr0)
	echo "${bold}$1${normal}"
}

echoColor () {
	white='\e[1;37m'
	echo -e "${1}$2${white}" 
}

installPack () {
	packName="$1"
	packGit="$2"
	packDestiny="$packsPath"/"$packName"/start

	if [[ -d $packDestiny ]]; then
   		echo "$(echoBold "$packName") $(echoColor $green "already installed")"
		return 0
	fi

   	printInfo "Installing $packName ($packGit)"
	mkdir -p $packDestiny
	cd $packDestiny
	git clone "$packGit"
}

space(){
	echo -e '\n'
}

cyan='\e[1;36m'
green='\e[1;32m'
red='\e[1;31m'
acceptWord=yes
vimPath=~/.vim
packsPath="$vimPath"/pack

echoColor $cyan "- - - - S E T T I N G    V I M - - - -"

space

if [ -d $vimPath ]; then
	echoColor $red Caution
	echoBold "$vimPath directory already exists"
	promptBool "$(echoBold "Are you sure you want to continue? $vimPath will be modified (enter '$acceptWord'): ")" $acceptWord

	if [ $? != 1 ]; then
		echoColor $red "Only '$acceptWord' will proceed. Aborting..."
		exit 1
	fi 
fi

space

mkdir -p $vimPath
mkdir -p $packsPath

# Set startup config files 
printInfo 'Generating .vimrc'
cp vimrc ~/.vimrc

# Read plugin data from plugins.csv file and install them 
printInfo 'Setting plugins'
while IFS=, read -r name gitUrl; do
	installPack "$name" "$gitUrl"
done < "$(pwd)"/plugins.csv

space

echoColor $green Done!

exit 0
