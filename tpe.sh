#!/bin/bash

USAGE="
\n
USAGE\n
    \t ${0} max_count_cities latitude longitude\n\n
DESCRIPTION\n
    \t  GET request for OpenWeatherAPI \n\n
ARGS\n 
    \t max_count_cities  \t  Maximum quantity of cities. Integer between 1 and 50 inclusive.\n
    \t latitude          \t\t  Latitude coordinate. Float between -90 and 90.\n
    \t longitude         \t\t  Longitude coordinate. Float between -180 and 180.\n\n
EXAMPLE\n
    \t${0} 2 56.36 28.16\n
"


if [ $# == 0 ] || [ $# != 3 ] ; then
    echo -e $USAGE
    exit 1
fi

CNT=$1
LATITUDE=$2
LONGITUDE=$3

#== REGULAR EXPRESIONS 
#== from: https://stackoverflow.com/questions/3518504/regular-expression-for-matching-latitude-longitude-coordinates

# WRONG_PARAMETER="Wrong parameter: "
# LONGITUDE_ERR0R="${WRONG_PARAMETER} Longitude"
# LATITUDE_ERROR="${WRONG_PARAMETER} Latitude"
# CNT_ERROR="${WRONG_PARAMETER} Cities quantity"
# LATITUDE_REGEX="^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?)$"
# LONGITUDE_REGEX="^[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$"
# CNT_REGEX="^50|[1-4][0-9]|[1-9]$"
# 
# if  [[ ! ($LATITUDE =~ $LATITUDE_REGEX) ]] ; then
#     echo $LATITUDE_ERROR
#     echo $USAGE
#     exit 1
# fi
# 
# if [[ ! ($LONGITUDE =~ $LONGITUDE_REGEX) ]] ; then
#     echo $LONGITUDE_ERROR
#     echo $USAGE
#     exit 1
# fi
# 
# if [[ ! ($CNT =~ $CNT_REGEX) ]]; then 
#     echo $CNT_ERROR
#     echo $USAGE
#     exit 1
# fi

OPENWEATHER_API="972f4eca99718ca311ec778723f21974"

curl "https://api.openweathermap.org/data/2.5/find?lat=${LATITUDE}&lon=${LONGITUDE}&cnt=${CNT}&appid=${OPENWEATHER_API}" -o data.xml

# data.xml + countries.xml---XQUERY---> weather_data.xml
