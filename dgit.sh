#!/bin/bash
# dgit: do a git push or pulil on all subdirs in current dir

cd $PWD
gitArg=$1

function doPushPull {
	for d in */; do
		cd $d
		echo $gitArg"ing in $d:"
		git $gitArg 
		cd ../
	done				
}

if [ $gitArg == 'push' -o $gitArg == 'pull' ]; then
	doPushPull
	exit 0
else
	echo -e 'Bad parameter, please supply a push or pull parameter.\n E.g dgit pull'
	exit 1
fi
