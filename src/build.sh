set -x

gcc -g -O0 -Wall -Wextra -save-temps=cwd -o ../bin/ballPhysics.exe *.c -I../include -lraylib -lm
mv *.{o,i,s} ../bin/obj/