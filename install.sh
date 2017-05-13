#!/bin/bash
SCRIPT_DIR=`dirname $(readlink -f $0)`
resource=${resource:-"mint-v2"}
location=${location:-"Cluj-Napoca"}



sudo apt-get install acpi

# setup conky (0.9.1)
sudo apt-get remove --purge conky-std && sudo apt-get autoremove
wget http://security.ubuntu.com/ubuntu/pool/universe/c/conky/conky-std_1.9.0-4_amd64.deb
sudo gdebi conky-std_1.9.0-4_amd64.deb
echo "conky version `conky -v | head -n 1 | cut -d \   -f 2`"
sudo apt-mark hold conky-std
#################################

chmod +x ${SCRIPT_DIR}/weather.sh
chmod +x ${SCRIPT_DIR}/conkystart.sh

ln -sf ${SCRIPT_DIR}/${resource}/conkyrc ~/.conkyrc
ln -sf ${SCRIPT_DIR}/conkystart.sh ~/.conkystart.sh

sed -i "s|__LOGO__|${SCRIPT_DIR}/${resource}/logo.png|g" ${SCRIPT_DIR}/${resource}/conkyrc
sed -i "s|__CLOCK_RINGS__|${SCRIPT_DIR}/${resource}/clock_rings.lua|g" ${SCRIPT_DIR}/${resource}/conkyrc
sed -i "s|__LOCATION__|${location}|g" ${SCRIPT_DIR}/${resource}/conkyrc
sed -i "s|__WEATHER__|${SCRIPT_DIR}/weather.sh|g" ${SCRIPT_DIR}/${resource}/conkyrc
