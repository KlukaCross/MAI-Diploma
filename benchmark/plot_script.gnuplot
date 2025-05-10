set terminal png size 800,600
set output 'output.png'
set title 'Performance Comparison'
set xlabel 'Data Rows'
set ylabel 'Time (ms)'
set key left top
plot 'results.dat' using 1:2 title 'Prototype' with linespoints lw 2 lt rgb 'green' pt 7 ps 0.7, \
     'results.dat' using 1:3 title 'pg dump + psql' with linespoints lw 2 lt rgb 'red' pt 7 ps 0.7
