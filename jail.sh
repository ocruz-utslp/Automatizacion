#!/bin/bash

for mat in $(cat matriculas)
do
	user="u$mat"
	path="/opt/jail/$user"
#	echo $path
	mkdir -p $path
	chown root:root $path
	jk_init -v $path basicshell
	jk_init -v $path extendedshell
	jk_init -v $path sh
	jk_init -v $path editors
	jk_init -v $path jk_lsh
	
	jk_jailuser -m -j $path $user
	cd $path
	while read line
	do
		# Dependiendo del contenido de $line ...
		case "$line" in "$user*")
		# Si es "imp33" o "imp44" agregamos un # delante
			echo #${line]
			;;
		*)
      		# En caso contrario mostramos tal cual la línea
      			echo $line
      			;;
  		esac
	done < $path/etc/passwd
	texto=$(cat /etc/passwd | grep u1253)
	echo $texto >> $path/etc/passwd	
done
