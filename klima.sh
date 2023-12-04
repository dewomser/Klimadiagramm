#!/bin/bash

wetterdienst values --provider=DWD --network=Observation --resolution=Annual --parameter=PRECIPITATION_HEIGHT --name=Worms  --format=csv>regen_klima.csv
wetterdienst values --provider=DWD --network=Observation --resolution=Annual --parameter=TEMPERATURE_AIR_MEAN_200 --name=Worms --format=csv>temp_klima.csv

paste -d ',' temp_klima.csv regen_klima.csv > klima.csv

sleep 2

gnuplot klima2.gp

sleep 2

gwenview klima2.png














