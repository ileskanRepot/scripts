qalc -s 'angle 0' -s 'angle degrees' -s 'color false' -s 'decimal comma on' -t "$(xclip -selection c -o | sed 's/bar//g' | sed 's/{/(/g' | sed 's/%pi/π/g' |sed 's/}/\)/g' | sed 's#cdot#*#g' | sed 's#over#/#g' | tr -d " ")" | tr -d "\n" | xclip -selection c -i

