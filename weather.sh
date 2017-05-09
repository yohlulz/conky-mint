# !/usr/bin/bash
METRIC=1 #Should be 0 or 1; 0 for F, 1 for C
if [ -z $1 ]; then
    echo "USAGE: weather.sh <locationcode>"
    exit 0;
fi

wget -q http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$1 -O - | awk \
'/Currently:/ {CurWeather=$0}
END{
    split(CurWeather,tmp,"Currently: ")
    split(tmp[2],tmp1,"<")
    split(tmp1[1],tmp2,":")
    CurWeather=sprintf("%s",tmp2[2])
    printf("%s\n",CurWeather)
}'
