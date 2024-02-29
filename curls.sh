#!/bin/bash
file=paginas.csv

echo "Pagina,Estatus" > $file
for pag in $(cat paginas)
do
	salida=$(curl -s -I "$pag" | sed -n '1p' | tail -1 | awk '{print $3" " $4}' | rev | cut -c3- | rev )
	if [ -z "$salida" ]
	then
		echo "$pag,FAIL" >> $file
	else
		echo "$pag,OK" >> $file
	fi
done

column -s, -t $file
rm -rf $file
