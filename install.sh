#!/bin/bash
SCRIPT_DIR=`dirname $(readlink -f $0)`
resource=${resource:-"mint-v2"}
location=${location:-"Cluj-Napoca"}



sudo apt-get install acpi conky
chmod +x ${SCRIPT_DIR}/weather.sh
chmod +x ${SCRIPT_DIR}/conkystart.sh

ln -sf ${SCRIPT_DIR}/${resource}/conkyrc ~/.conkyrc
ln -sf ${SCRIPT_DIR}/conkystart.sh ~/.conkystart.sh

sed -i "s|__LOGO__|${SCRIPT_DIR}/${resource}/logo.png|g" ${SCRIPT_DIR}/${resource}/conkyrc
sed -i "s|__CLOCK_RINGS__|${SCRIPT_DIR}/${resource}/clock_rings.lua|g" ${SCRIPT_DIR}/${resource}/conkyrc
sed -i "s|__LOCATION__|${location}|g" ${SCRIPT_DIR}/${resource}/conkyrc
sed -i "s|__WEATHER__|${SCRIPT_DIR}/weather.sh|g" ${SCRIPT_DIR}/${resource}/conkyrc
