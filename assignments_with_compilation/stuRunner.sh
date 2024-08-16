# $1 - path to student's solution
# $2 - path to the input file


# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <test_case_file>"
    exit 1
fi

# Make the student's solution executable
chmod a+x $1

# Run the student's compiled binary
# Output will be printed to the console
# Internal timer of 5 seconds
$1 < $2


# End of file
