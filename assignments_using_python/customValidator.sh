# $1 <- expected output (reference sol output)
# $2 <- actual output (student's output)

# Straight-forward validator 
# Note: that -Z ignores trailing whitespaces
if diff -Z "$1" "$2" > /dev/null 2>&1; then
    echo 0  # Files are identical
else
    echo 1  # Files are different
fi

# You can always write a custom validator. There are several options
# 1. Use regex to parse the outputs and check them in bash script
# 2. Call a python fn to validate them
# 3. Use complex arguments in diff to ignore redundant spaces, etc.
