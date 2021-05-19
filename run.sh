#!/bin/bash

# folders
f_modules=modules
f_output=outputs
args=$@

function help {
	echo "This is a help function"
}

function compile_all_modules {
	res_compile="$(iverilog $(ls $f_modules/*.v))"

	if [ !$res_compile ]; then
		echo 'Correctly compiled'
	else
		echo $res_compile
	fi
}

function main {

	if [[ ${args[0]} == "help" || ${args[0]} == "h" ]]; then
		help
	else
		compile_all_modules
	fi
}

main