# OpenWeatherMap XML ☁️

This project aims to provide a webpage of current weather conditions among various cities, separated by country. In case of finding errors in the entered parameters, its processing is delegated to the OpenWeather API and maintaining the previous flow of the programs, the error obtained is shown as a header in the webpage.

## Sources

1. `countries.xml`: contains a list of countries.
2. `data.xml`: Obtained from calling the GET [find cities by circle](https://openweathermap.org/current#cycle) method from the OpenWeather Map REST API. This method returns, given a geographic coordinate (with **_latitude_** and **_longitude_**) and a **_cnt_** number, a list of the **_cnt_** nearest cities with their respective weather metrics.

## Usage
In order to use the program, you must first set an environment variable `OPENWEATHER_API` to the key given by the OpenWeather API. Then, run the following command: 

```bash 
$./tpe.sh cnt latitude longitude
``` 

(See **_Constraints_** for more information about the parameters). 

When executed, `tpe.sh` will create `data.xml` with the information obtained by the OpenWeather API. Then, it will execute `extract_weather_data.xq` to combine the data from `data.xml` and `country.xml`, thus generating the file `weather_data.xml`. Finally, through `generate_page.xsl` the `weather_page.html` file is created in the same directory (which is linked to `style.css`), using `weather_data.xml`. 



## Constraints
* **_cnt_** must be an integer between 1 and 50 inclusive
* **_latitude_** must be a real number so that -90.0 < **_latitude_** < 90.0
* **_longitude_** must be a real number so that -180.0 < **_longitude_** < 180.0

## Screenshots
```bash
$./tpe.sh 6 -26 -54.43
```
[![Screenshot1.png](https://i.postimg.cc/jjmNyxzB/Screenshot1.png)](https://postimg.cc/hJ8fBqZ0)
```bash
$./tpe.sh 5 55 55
```
[![Screenshot.png](https://i.postimg.cc/903MQzGF/Screenshot.png)](https://postimg.cc/LYTRy9Cr)

