set title "Klimaentwicklung für Worms. Erstellt: "  .strftime("%d.%b %Y %H:%M", time(0)+3699) .' mit Opendata vom DWD'
set datafile separator ','
set xdata time
set timefmt "%Y-%m-%dT%H:%M"
set format x "%Y" # otherwise it will show only MM:SS
set key autotitle columnhead
set ylabel "Temperatur in°C Jahresdurchschnitt"
set xlabel 'Zeitachse'
set xtics rotate

set y2tics # enable second axis
set ytics nomirror # dont show the tics on that side
set y2label "Jährlicher Niederschlag in mm" # label for second axis
#set terminal wxt size 800,600 enhanced font 'Verdana,10' persist
set terminal pngcairo size 800,600 enhanced font 'Verdana,10'
set output 'klima2.png'

plot 'klima.csv' using 1:($2-273.15) smooth bezier title 'Temperatur °C' with lines lc "red",'' using 1:4 smooth bezier with lines axis x1y2 title 'Niederschlag  mm/Y
