#!/bin/bash
function create(){
	#get templates and extensions
	#from template directory
	template_dir=~/.templates/

	extensions=$(find $template_dir -type f | sed 's|.*\.||' | sort -u)
	read -a arr <<<$extensions

	#create empty file
	command touch $1

	#loop through avail
	#templates and if there
	#is a match in file extensions
	#append the text into the file
	for var in ${arr[@]}
	do
		if [[ ${1: -${#var}} == $var ]]
			then
			cat ~/.templates/template.$var > $1;
		fi
	done
}