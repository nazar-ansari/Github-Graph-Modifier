#!/bin/bash
year=$(date +%g)							 #22
current_year=20$year 						#2022
previous_year=$( expr $(date +%g) - 1) 		#21
starting_year=20$previous_year 			#2021
