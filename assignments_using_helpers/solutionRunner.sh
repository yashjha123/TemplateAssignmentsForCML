# $1 - path to teacher's solution
# $2 - path to the input file


# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <test_case_file>"
    exit 1
fi

# Run the student's solution
# Output will be printed to the console
# Internal timer of 5 seconds
timeout 5 python3 $1 < $2 


# End of file
