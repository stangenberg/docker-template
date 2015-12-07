#!/bin/sh

echo "______           _               _____                    _       _       ";
echo "|  _  \         | |             |_   _|                  | |     | |      ";
echo "| | | |___   ___| | _____ _ __    | | ___ _ __ ___  _ __ | | __ _| |_ ___ ";
echo "| | | / _ \ / __| |/ / _ \ '__|   | |/ _ \ '_ \` _ \| '_ \| |/ _\` | __/ _ \ ";
echo "| |/ / (_) | (__|   <  __/ |      | |  __/ | | | | | |_) | | (_| | ||  __/";
echo "|___/ \___/ \___|_|\_\___|_|      \_/\___|_| |_| |_| .__/|_|\__,_|\__\___|";
echo "                                                   | |                    ";
echo "                                                   |_|                    ";
echo "                                                                          ";
echo "                                                                          ";
echo "                     Creating a new Docker image"
echo ""

checkdir() {
	dirname=$1
	if [ -d $dirname ]
	then
		echo "directory $dirname exists already - aborting"
		exit 1
	fi
	mkdir $dirname
}

load() {
	echo "Creating $1"
	curl --progress-bar $baseurl/$1 -o $dirname/$1
}

if [ -z $1 ]
then
  read -p "Please name the new image: " inputname </dev/tty
fi

if [ "$1" ]
then
  inputname=$1
fi

imagename=${inputname// /_}
dirname=$(pwd -L)/docker-$imagename
checkdir $dirname

if [ -z "$2" ]
then
  read -p "What is it about? " description </dev/tty
fi

echo ""
echo ""
echo "creating project in $dirname"
echo ""
echo ""

baseurl=${3:-"https://raw.githubusercontent.com/stangenberg/docker-template/master/template"}

load Dockerfile
load LICENSE.md
load LICENSE.txt
load Makefile
load README.md
load .gitignore

sed -i '' "s/imagename/$imagename/g" $dirname/Makefile
sed -i '' "s/imagename/$imagename/g" $dirname/README.md
sed -i '' "s/description/$description/g" $dirname/README.md

echo ""
echo "Ready."
