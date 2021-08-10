#!/bin/bash

WAGE_PER_HOUR=20
IS_FULL_TIME=2
IS_PART_TIME=1
EMPLOYEE_HOUR_FULLTIME=8
EMPLOYEE_HOUR_PARTTIME=4

read -p "To number of working days :" NUMBER_OF_WORKING_DAYS
read -p "To number of working hour :" NUMBER_OF_WORKING_HOURS

totalSalary=0
totalEmployeeHours=0
totalWorkingDays=0

function getWorkHours()
{
	randomShiftCheck=$((RANDOM%3))
	case $randomShiftCheck in

		$IS_FULL_TIME )
			employeeHour=$((EMPLOYEE_HOUR_FULLTIME))
			;;
		$IS_PART_TIME )
			employeeHour=$((EMPLOYEE_HOUR_PARTTIME))
			;;
		* )
			employeeHour=0
			;;
   esac
	echo $employeeHour
}

function calculateWage()
{
	employeeHour=$1
	wage=$(($employeeHour*$WAGE_PER_HOUR))
	echo $wage
}

while [[ $totalEmployeeHours -lt $NUMBER_OF_WORKING_HOURS && $totalWorkingDays -lt $NUMBER_OF_WORKING_DAYS ]]
do
	((totalWorkingDays++))
	dailyWage[totalWorkingDays]=$(calculateWage $(getWorkHours))
	totalEmployeeHours=$(($totalEmployeeHours + $(getWorkHours)))
done

totalWageOfMonth=$(($(calculateWage $totalEmployeeHours)))
echo "Total wage :"$totaleWageOfMonth
echo "Daily wages: ${dailyWage[@]}"
echo "Day:${!dailyWage[@]}"
