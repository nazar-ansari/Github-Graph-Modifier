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
read remaining			# To Get Total Number To perfom commits
git clone $filepath &> /dev/null
echo $filepath >> step1.txt  				# Gives Sample ``https://github.com/nazar-ansari/some-demo.git``
cut -d/ -f 5 step1.txt > step2.txt			# Cut To the `some-demo.git`
cut -d. -f 1 step2.txt > step3.txt			#  Get The Name of Directory `some-demo`
path=$(cat step3.txt)
cd $path											  # Change The path form current Directory To Clone Repo
rm -rf ../step*
months=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sept" "Oct" "Nov" "Dec")
datenumber=$(date +%m)				# Results example of Apr will 04
intdatenumber=$(expr $datenumber + 10 - 10 ) 		#To Convert Into Integer
totaldatenumber=$(( 12 + intdatenumber ))
commitspermonth=$(( remaining / totaldatenumber))			# To get the number of commits per month
