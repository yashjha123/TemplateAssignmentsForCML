# $1 - path to teacher's solution
# $2 - path to the input file


# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <test_case_file>"
    exit 1
fi

# Unzip the input file
unzip -qqn $2 -d ./case/

# check if the command was successful
if [ $? -ne 0 ]; then
    echo "Error: Unable to unzip the file"
    exit 1
fi

# Run the teacher's solution
# Output will be printed to the console
# Internal timer of 5 seconds
ulimit -t 5 # CPU time limit
python3 $1 ./case/a ./case/b


# End of file
