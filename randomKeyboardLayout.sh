#!/usr/bin/env bash

row_1=$(echo {24..33})
row_2=$(echo {38..46})
row_3=$(echo {52..58})
all_rows=( ${row_1[*]} ${row_2[*]} ${row_3[*]} )
all_rows_mix=( $(shuf -e ${all_rows[@]}) )
alphabets=($(echo {a..z}))

echo -n ${row_1[*]}\ 
echo -n ${row_2[*]}\ 
echo ${row_3[*]}
echo ${all_rows[*]}
echo ${all_rows_mix[*]}
echo ${#all_rows[*]}
echo ${alphabets[*]}
for i in {0..25};
do
#	echo "xmodmap -e \"keycode ${all_rows_mix[$i]} = ${alphabets[$i]}\""
	xmodmap -e "keycode ${all_rows_mix[$i]} = ${alphabets[$i]}"
	echo ${alphabets[$i]}
done
# 24 -> 33
# 38 -> 46
# 52 -> 58
