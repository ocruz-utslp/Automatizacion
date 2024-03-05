#!/bin/bash
suma=0

for num in $(column -s, -t Accidentes_ags_2021.csv | sed -e "1d" | awk '{print $25}')
do
	suma=$((suma+num))
done

echo $suma
