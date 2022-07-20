#!/bin/bash
year=$(date +%g)							 #22
RunningYear=20$year 						#2022
PreviousYearNumber=$( expr $(date +%g) - 1) 		#21
StartingCommitYear=20$PreviousYearNumber 			#2021

#									Banner To Get The Url Of Source
echo -ne "\033[1;36m\t\t\t - - - - - - - - - - - - - - - - - - - - - - - - - - \n"
echo -ne "\033[1;36m\t\t\t|    Paste The Remote U.R.L Of The Your Repository  |\n"
echo -ne "\033[1;36m\t\t\t - - - - - - - - - - - - - - - - - - - - - - - - - - \n"
echo ""
read URL_Path			# To get The Link of Repo
clear
echo -ne "\t\t\tEnter The Total Number of \"COMMITS\" You Want To Be Proced :\n"
read Number_of_Commits			# To Get Total Number To perfom commits

git clone $URL_Path &> /dev/null
echo $URL_Path >> step1.txt  				# Gives Sample ``https://github.com/nazar-ansari/some-demo.git``
cut -d/ -f 5 step1.txt > step2.txt			# Cut To the `some-demo.git`
cut -d. -f 1 step2.txt > step3.txt			#  Get The Name of Directory `some-demo`
Directory_Path=$(cat step3.txt)
cd $Directory_Path			              		  # Change The path form current Directory To Clone Repo
rm -rf ../step*

Months_Array=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sept" "Oct" "Nov" "Dec")
CurrMonthInt=$(date +%m)				# Results example of Apr will 04
Current_Month=$(expr $CurrMonthInt + 10 - 10 ) 		#To Convert Into Integer
Total_Months=12
Commits_Per_month=$(( Number_of_Commits / Total_Months))			# To get the number of commits per month

#									For Loop To execute For Previous Year
echo -ne "\e[93m \t\t\t* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \n"
for Month_In_PrevYear in $( seq $( expr $Current_Month + 1) 12 );do
	if [ $Month_In_PrevYear -eq 2 ] ;then				# If a Month Is February
		echo -ne "\t\t\t ${Months_Array[ $(( Month_In_PrevYear - 1 )) ]} \n" >> message.txt
		for daysinfeb in $(seq 1 $Commits_Per_month);do
			febrandom=$((RANDOM%28 + 1))
			echo "committed on ${StartingCommitYear}-${Month_In_PrevYear}-${febrandom}" >> message.txt ;
			git add . &> /dev/null
			git commit -m "created on ${StartingCommitYear}-${Month_In_PrevYear}-${febrandom} " --date=${StartingCommitYear}-${Month_In_PrevYear}-${febrandom} &> /dev/null
			let Number_of_Commits=Number_of_Commits-1
			echo -ne "\e[93m \t\t\t* - - - - ->\tRemaining Duration is : \" $Number_of_Commits s\" <- - - - - * \r"			# sleep 0.05
		done			
	else							# For Other Months
		echo -ne "\t\t\t ${Months_Array[ $(( Month_In_PrevYear - 1 )) ]} \n" >> message.txt
		for daysinmonth in $(seq 1 $Commits_Per_month);do
	    	othermonthrand=$((RANDOM%30 + 1))
		    echo "committed on ${StartingCommitYear}-${Month_In_PrevYear}-${othermonthrand}" >> message.txt ;
			git add . &> /dev/null
			git commit -m "created on ${StartingCommitYear}-${Month_In_PrevYear}-${othermonthrand} " --date=${StartingCommitYear}-${Month_In_PrevYear}-${othermonthrand} &> /dev/null
			let Number_of_Commits=Number_of_Commits-1
			echo -ne "\e[93m \t\t\t* - - - - ->\tRemaining Duration is : \" $Number_of_Commits s\" <- - - - - * \r"			# sleep 0.05
		done
	fi
	echo -ne "\t\t\t-----------------------------------------------------\n" >> message.txt;
done

#									For Loop To Execute For Current Year
thismonth=$(date +%m)
tillnumber=$(expr $thismonth + 10 - 10 )
for  monthofcurrentyear in {1..12};do
	if [ $monthofcurrentyear -eq $(( $tillnumber + 1 )) ] ; then
		break
	else
		if [ $monthofcurrentyear -eq 2 ] ;then
			echo -ne "\t\t\t ${Months_Array[ $(( monthofcurrentyear - 1 )) ]} \n" >> message.txt
			for daysinfeb in $(seq 1 $Commits_Per_month);do
				febrandom=$((RANDOM%28 + 1))
				echo "committed on ${RunningYear}-${monthofcurrentyear}-${febrandom}" >> message.txt ;
				git add . &> /dev/null
				git commit -m "created on ${RunningYear}-${monthofcurrentyear}-${febrandom} " --date=${RunningYear}-${monthofcurrentyear}-${febrandom} &> /dev/null
				let Number_of_Commits=Number_of_Commits-1
				echo -ne "\e[93m \t\t\t* - - - - ->\tRemaining Duration is : \" $Number_of_Commits s\"\t <- - - - - * \r"			# sleep 0.05
			done			
		else
			echo -ne "\t\t\t ${Months_Array[ $(( monthofcurrentyear - 1 )) ]} \n" >> message.txt
			for daysinmonth in $(seq 1 $Commits_Per_month);do
				othermonthrand=$((RANDOM%30 + 1))
			    echo "committed on ${RunningYear}-${monthofcurrentyear}-${othermonthrand}" >> message.txt ;
				git add . &> /dev/null
				git commit -m "created on ${RunningYear}-${monthofcurrentyear}-${othermonthrand} " --date=${RunningYear}-${monthofcurrentyear}-${othermonthrand} &> /dev/null
				let Number_of_Commits=Number_of_Commits-1
				echo -ne "\e[93m \t\t\t* - - - - ->\tRemaining Duration is : \" $Number_of_Commits s\"\t <- - - - - * \r"			# sleep 0.05
			done
		fi
	echo -ne "\t\t\t-----------------------------------------------------\n" >> message.txt;
	fi
done
sleep 2
git push &> /dev/null						# To Push The Commits To The Official Repo
sleep 0.5
clear
echo -ne "\n"
echo -ne "\033[1;36m\t\t\t - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  \n"
echo -ne "\033[1;36m\t\t\t|    DONE ! With The Process Check YOUR \"Remote\" Repo Now |\n"
echo -ne "\033[1;36m\t\t\t - - - - - - - - - - - - - - - - - - - - - - - - - - - - - \n"
echo ""

#								To Get The U.R.L of the Repository To open
echo $URL_Path >> steplink.txt
Url_Link=$(cut -d/ -f 1-4 steplink.txt)
rm -rf steplink.txt
#							Steps To Check Whether The Script Running On Windows Bash or LINUX
echo 1 + 1 | bc &> /dev/null
if [ $? -eq 0 ]; then
	firefox $Url_Link
else
	start chrome $Url_Link
fi
cd ..
