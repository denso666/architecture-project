#!/bin/bash

# folders
f_modules=modules
f_tb=tbs

# script arguments
args=$@

# provide a structure of command
function help {
	echo "Commandas:"
	echo "'modules' to compile all modules located in /modules folder"
	echo "'tbs'     to compile all test benchs located in /tbs folder"
}

# compile all verilog modules in 'modules' folder
function compile_modules {
	res_compile="$(iverilog $(ls $f_modules/*.v))"

	if [ !$res ]; then
		echo 'MODULES: Correctly compiled'
	else
		echo $res
	fi
}

# compile all verilog test bench in 'tbs' folder
function compile_test_benchs {
	res="$(iverilog $(ls $f_tb/*.v))"

	if [ !$res ]; then
		echo 'TEST-BENCHS: Correctly compiled'
	else
		echo $res
	fi
}


function main {

	case ${args[0]} in

		"help" | "h")
			help
	    ;;

	  	"modules")
	    	compile_modules
	    ;;

	  	"tbs")
	    	compile_test_benchs
	    ;;

	  	*)
	    	compile_modules
	    	compile_test_benchs
	    ;;
	esac

}

main