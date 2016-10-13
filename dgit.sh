#!/bin/bash
# dgit: do a git push/pull or checkout on all subdirs in current dir

cd $PWD
gitArg=$1
secArg=$2

function dirloop {
	for d in */; do
		cd $d
		if [ $gitArg == 'push' -o $gitArg == 'pull' ]; then
			echo $gitArg"ing in $d:"
			git $gitArg
		elif [ $gitArg == 'checkout' ]; then
			echo "checking out to $secArg:"
		        git $gitArg $secArg
		else
        		echo -e 'Bad parameter, please supply a push/pull or checkout parameter.\n E.g dgit pull \n E.g checkout BRANCH'
        		exit 1
		fi
		cd ../
	done	
}

dirloop
