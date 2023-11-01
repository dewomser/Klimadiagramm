#!/bin/bash

wetterdienst values --provider=DWD --network=Observation --resolution=Annual --parameter=PRECIPITATION_HEIGHT --name=Worms  | jq -r '.[]| [.date,.value ] | @csv'>regen_klima.csv
wetterdienst values --provider=DWD --network=Observation --resolution=Annual --parameter=TEMPERATURE_AIR_MEAN_200 --name=Worms | jq -r '.[]| [.date,.value ] | @csv'>temp_klima.csv

paste -d ',' temp_klima.csv regen_klima.csv > klima.csv

sleep 2

gnuplot klima3.gp

sleep 2

gwenview klima3.png














