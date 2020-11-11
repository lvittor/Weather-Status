# TPE XML 2C 2020

The following bash script, along with the corresponding xslt, xq and xml files, produces a html webpage of current weather conditions among various cities. The weather information is obtained through the use of the OpenWeather API. When given coordinates and an amount _n_, the API will provide the weather of the _n_ cities closest to the given coordinates. The result will be a webpage with the information gathered among several tables, separated by country.

## Usage
In order to use the program, you must first set an environment variable `OPENWEATHER_API` to the key given by the OpenWeather API.Then, run the following command:
`./tpe.sh cnt latitude longitude` (See **Constraints** for more information about the parameters). After the script has terminated, the _weather_page.html_ file will be created within the same directory. Be mindful that this is linked to _style.css_.

## Constraints
* _cnt_ must be an integer between 1 and 50 inclusive
* _latitude_ must be a real number so that -90.0 < _latitude_ < 90.0
* _longitude_ must be a real number so that -180.0 < _longitude_ < 180.0

