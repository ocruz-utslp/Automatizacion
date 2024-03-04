#!/bin/bash

for mat in $(cat matricula)
do
        user="u$mat"
	path=/home/$user/
        cp Accidentes_ags_2021.csv $path
done

