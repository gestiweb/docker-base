#!/bin/bash
pass1=$(pwgen -1 128)

sed -i 's/BLOWFISH_SECRET_TO_REPLACE/'$pass1'/' /var/www/html/phpmyadmin/config.inc.php

