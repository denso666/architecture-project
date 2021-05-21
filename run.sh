#!/bin/bash

# folders
f_modules=modules
f_tb=tbs
f_vcd=vcd

# script arguments
args=$@

# colors
red=`tput setaf 5`
green=`tput setaf 2`
reset=`tput sgr0`

# provide a structure of command
function help {
	echo "Commandas:"
	echo "-> 'all'     to compile modules and test benchs"
	echo "-> 'modules' to compile all modules located in /modules folder"
	echo "-> 'tbs'     to compile all test benchs located in /tbs folder"
}

# compile all verilog modules in 'modules' folder
function compile_modules {
	iverilog $(ls $f_modules/*.v) 2> error

	if [[ "$(wc -l error)" != "0 error" ]]; then
		echo "${red}$(cat error)${reset}"
	else
		echo "${green}@ MODULES: Correctly compiled${reset}"
	fi

	rm error
}

# compile all verilog test bench in 'tbs' folder
function compile_test_benchs {
	iverilog $(ls $f_tb/*.v) 2> error

	if [[ "$(wc -l error)" != "0 error" ]]; then
		echo "${red}$(cat error)${reset}"
	else
		echo "${green}@ TEST-BENCHS: Correctly compiled${reset}"
	fi

	rm error
}

# move all vcd files to 'vcd' folder
function move_vcd {
	mv *.vcd $f_vcd/ 2> temp

	wc -l temp

	if [ "$(wc -l temp)" != "0 temp" ]; then
		echo "${red}@WAVE: waves files not found${reset}"
	else
		echo "${green}@WAVE: waves files was mooved to 'vcd' folder${reset}"
	fi

	rm temp
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

		"all")
			compile_modules
	    	compile_test_benchs
	    ;;

		"vcd")
	    	move_vcd
	    ;;

	  	*)
	    	help
	    ;;
	esac

}

main
