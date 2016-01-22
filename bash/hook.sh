#!/bin/bash

# First, get the zip file

# cd /var/www/import && wget -O $1 -q https://github.com/maxgosset/dockerhook/archive/master.zip

# # # Second, unzip it, if the zip file exists
# if [ -f /var/www/import/$1 ]; then
#     # Unzip the zip file
#     unzip -q /var/www/import/$1

#     # Delete zip file
#     rm /var/www/import/$1


#     # Rename project directory to desired name
#     mv Project-master hook

#     # Delete current directory
#     rm -rf /var/www/somesite.com

#     # Replace with new files
#     mv somesite.com /var/www/

#     # Perhaps call any other scripts you need to rebuild assets here
#     # or set owner/permissions
#     # or confirm that the old site was replaced correctly
# fi
#!/bin/bash

# First, get the zip file

cd /var/www/import && wget -O $1 -q https://github.com/maxgosset/dockerhook/archive/master.zip

# # Second, unzip it, if the zip file exists
if [ -f /var/www/import/$1 ]; then
    # Unzip the zip file
    unzip -q /var/www/import/$1

    # Delete zip file
    rm /var/www/import/$1


    # Rename project directory to desired name
    mv $3-master $4

    # Delete current directory


    # Replace with new files
    mv $4 /var/www/$3/$4

    # Perhaps call any other scripts you need to rebuild assets here
    # or set owner/permissions
    # or confirm that the old site was replaced correctly

	# modification du fichier default

    sed -i "s/$5/$4/g" /etc/nginx/sites-enabled/default
    if [ -f "/var/www/$3/$4/last.sql" ]; then
		echo " add user and database mysql"
		Q2="CREATE DATABASE IF NOT EXISTS $4;"
		SQL="${Q2}"
		mysql -uroot -pMar10KartW11 -e "$SQL"
    fi
fi
