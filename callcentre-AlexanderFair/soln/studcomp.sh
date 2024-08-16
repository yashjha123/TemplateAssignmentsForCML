mv $1 tmp.c
g++ tmp.c -std=c++11 -g -o $2
mv tmp.c $1
