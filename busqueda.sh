#!/bin/bash

column -s, -t Accidentes_ags_2021.csv | grep -i adolfo | awk '{print $1 "\t" $19}'
