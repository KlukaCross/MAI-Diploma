set terminal png size 1000,800
set output 'output.png'
set title 'Сравнение производительности' font ',20'
set xlabel 'Количество необходимых взаимосвязанных данных после переноса' font ',16'
set ylabel 'Время (мс)' font ',16'
set key left top
set format x '%.0e'
set format y '%.1e'
set xtics font ',14,bold'
set ytics font ',14,bold'
plot 'results.dat' using 1:2 title 'Минимальный жизнеспособный продукт' with linespoints lw 2 lt rgb 'green' pt 7 ps 0.7, \
     'results.dat' using 1:3 title 'pg dump + psql' with linespoints lw 2 lt rgb 'red' pt 7 ps 0.7
