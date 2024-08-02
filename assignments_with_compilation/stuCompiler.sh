# $1 <- path to the student's solution to compile
# $2 <- path to the output file (binary)

sleep 4

mv $1 tmp.c
gcc tmp.c -o $2
mv tmp.c $1
