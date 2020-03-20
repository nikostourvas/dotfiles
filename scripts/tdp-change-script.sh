#!/bin/bash

original=$1
new=$2

sudo sed -i "s/$original/$new/g" /etc/lenovo_fix.conf
sudo systemctl restart lenovo_fix.service
echo "cTDP set to $new W"
