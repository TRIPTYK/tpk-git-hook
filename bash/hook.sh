#!/bin/bash

# First, get the zip file
cd /var/www/import && wget -O $1 -q https://github.com/maxgosset/dockerhook/archive/master.zip

# Second, unzip it, if the zip file exists
# if [ -f /var/www/import/projectmaster.zip ]; then
#     # Unzip the zip file
#     unzip -q /var/www/import/projectmaster.zip
# 
#     # Delete zip file
#     rm /var/www/import/projectmaster.zip
# 
#     # Rename project directory to desired name
#     mv Project-master hook
# 
#     # Delete current directory
#     rm -rf /var/www/somesite.com
# 
#     # Replace with new files
#     mv somesite.com /var/www/
# 
#     # Perhaps call any other scripts you need to rebuild assets here
#     # or set owner/permissions
#     # or confirm that the old site was replaced correctly
# fi