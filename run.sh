#!/bin/bash

# folders
f_modules=modules
f_modules_buffers=modules/buffers
f_tb=tbs
f_vcd=vcd
f_python=decoder

# script arguments
args=$@

# colors
reset=`tput sgr0`
red=`tput setaf 5`
blue=`tput setaf 6`
green=`tput setaf 2`

# provide a structure of command
function help {
	echo "${blue}Commandas:"
	echo "-> 'all'     to compile modules and test benchs"
	echo "-> 'modules' to compile only modules located in /modules folder"
	echo "-> 'tbs'     to compile only test benchs located in /tbs folder"
	echo "-> 'vcd'     to create wave from an a.out file"
	echo "-> 'wave'    to open created wave file"
	echo "-> 'decode'  to execute python decoder${reset}"
}

# compile all verilog modules in 'modules' folder
function compile_modules {
	iverilog $(ls $f_modules/*.v) $(ls $f_modules_buffers/*.v) 2> error

	if [[ "$(wc -l error)" != "0 error" ]]; then
		echo "${red}$(cat error)${reset}"
	else
		echo "${green}@ MODULES: Correctly compiled${reset}"
		rm a.out
	fi

	rm error
}

# compile all verilog test bench in 'tbs' folder
function compile_test_benchs {
	iverilog $(ls $f_tb/*.v) $(ls $f_modules/*.v) $(ls $f_modules_buffers/*.v) 2> error

	if [[ "$(wc -l error)" != "0 error" ]]; then
		echo "${red}$(cat error)${reset}"
	else
		echo "${green}@ TEST-BENCHS: Correctly compiled${reset}"
		rm a.out
	fi

	rm error
}

# compile all modules including test benchs
function compile_all {
	iverilog $(ls $f_tb/*.v) $(ls $f_modules/*.v) $(ls $f_modules_buffers/*.v) 2> error

	if [[ "$(wc -l error)" != "0 error" ]]; then
		echo "${red}$(cat error)${reset}"
	else
		echo "${green}@ ALL: Correctly compiled${reset}"
	fi

	rm error
}

# create wave file from out
function create_wave {
	vvp a.out 2> temp

	if [[ "$(wc -l temp)" != "0 temp" ]]; then
		echo "${red}@WAVE: out file not found"
		echo "@HINT: To create a wave file first run 'all'${reset}"
		rm temp
	else
		move_vcd
	fi
}

# move all vcd files to 'vcd' folder
function move_vcd {
	mv *.vcd $f_vcd/ 2> temp

	if [[ "$(wc -l temp)" != "0 temp" ]]; then
		echo "${red}@WAVE: waves files not found${reset}"
	else
		echo "${green}@WAVE: waves files was mooved to 'vcd' folder${reset}"
	fi

	rm temp
}

# open with gtkwave the wave file created
function open_wave {
	gtkwave $f_vcd/*.vcd
}

# execute python decoder
function decode {
	python3 $f_python/decoder.py
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
			compile_all
	    ;;

		"vcd")
	    	create_wave
	    ;;

		"wave")
	    	open_wave
	    ;;

		"decode")
	    	decode
	    ;;

	  	*)
	    	help
	    ;;
	esac

}

main
