#!/bin/bash
year=$(date +%g)							 #22
current_year=20$year 						#2022
previous_year=$( expr $(date +%g) - 1) 		#21
starting_year=20$previous_year 			#2021
#									Banner To Get The Url Of Source
echo -ne "\033[1;36m\t\t\t - - - - - - - - - - - - - - - - - - - - - - - - - - \n"
echo -ne "\033[1;36m\t\t\t|    Paste The Remote U.R.L Of The Your Repository  |\n"
echo -ne "\033[1;36m\t\t\t - - - - - - - - - - - - - - - - - - - - - - - - - - \n"
echo ""
read filepath			# To get The Link of Repo
clear
