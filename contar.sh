#!/bin/bash
mujeres=0
hombres=0
otro=0

for num in $(column -s, -t Accidentes_ags_2021.csv | sed -e "1d" | awk '{print $28}')
do
	if [ $num -eq 1 ]
	then
		mujeres=$((mujeres+1))
	elif [ $num -eq 2 ]
	then 
		hombres=$((hombres+1))
	else
		otro=$((otro+1))
	fi
done
echo Mujeres: $mujeres
echo Hombres: $hombres
echo Otro: $otro
