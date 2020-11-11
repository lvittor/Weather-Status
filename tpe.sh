#!/bin/bash

CNT=$1
LATITUDE=$2
LONGITUDE=$3
# OPENWEATHER_API="972f4eca99718ca311ec778723f21974"

rm -rf data.xml weather_data.xml weather_page.html

curl "https://api.openweathermap.org/data/2.5/find?lat=${LATITUDE}&lon=${LONGITUDE}&cnt=${CNT}&mode=xml&appid=${OPENWEATHER_API}" -o data.xml

java net.sf.saxon.Query -q:extract_weather_data.xq -o:weather_data.xml

java net.sf.saxon.Transform -s:weather_data.xml -xsl:generate_page.xsl -o:weather_page.html