#!/bin/bash

for mat in $(cat matricula)
do
	user="u$mat"
#	echo $user
	useradd -m -s /bin/rbash -d /home/$user $user
#	echo "$user" | passwd -stdin $user
	echo "$user:$user" | /usr/sbin/chpasswd
	chage -d0 $user
	passwd -e $user
	mkdir /home/$user/bin
	for com in $(cat comandos)
	do
		ln -s /bin/$com /home/$user/bin/$com
	done
	rm -rf /home/$user/.bash_profile
	cp perfil_bash /home/$user/.bash_profile
	#touch /home/$user/.bash_profile
	chown root. /home/$user/.bash_profile
	chmod 755 /home/$user/.bash_profile
	
done

#prueba de cambio
