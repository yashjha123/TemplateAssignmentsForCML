# $1 - path to teacher's solution
# $2 - path to the input file

validate_test_case() {
    # Check if the file exists
    if [ ! -f "$1" ]; then
        echo "Error: File not found: $1"
        exit 1
    fi

    # Read the contents of the file into an array, handling both Unix and Windows line endings
    IFS=$'\r\n' GLOBIGNORE='*' command eval 'lines=($(cat "$1"))'



    pattern='^\s*([0-9]+)\s+([0-9]+)\s*$'
    # Check the first line
    first=${lines[0]}
    if [[ $first =~ $pattern ]]; then
        a="${BASH_REMATCH[1]}"
        b="${BASH_REMATCH[2]}"

        if ((a <= 0  || b <= 0)); then
            echo "Error: Negative numbers not allowed"
            exit 1
        fi

        if ((a >= 256 || b >= 256)); then
            echo "Error: Large numbers not allowed"
        fi

        exit 0

    else
        echo "Error: The file does not contain exactly two numbers separated by whitespace."
        exit 1
    fi


    
    # If all checks pass, the test case is valid
    exit 0
}



# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <test_case_file>"
    exit 1
fi


# Validate the test case
validate_test_case "$1"

# End of file
