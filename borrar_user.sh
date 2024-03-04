#!/bin/bash

for mat in $(cat matricula)
do
        user="u$mat"
        userdel -r $user
done

