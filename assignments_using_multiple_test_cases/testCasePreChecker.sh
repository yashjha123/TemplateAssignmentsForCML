# $1 - path to teacher's solution
# $2 - path to the input file

validate_test_case() {
    # Check if the file exists
    if [ ! -f "$1" ]; then
        echo "Error: File not found: $1"
        exit 1
    fi

    # Read the contents of the file into an array, handling both Unix and Windows line endings
    # IFS=$'\r\n' GLOBIGNORE='*' command eval 'lines=($(cat "$1"))'
    if ! unzip -tqq $1; then
        echo "Error: File is not a valid zip file"
        exit 1
    fi

    # check if the zip file contains exactly two files with names a and b
    # while this command is not perfect, it is good enough for this assignment
    # in practice you would need to handle more edge cases
    # for example, the zip file could contain a directory structure
    # strict file name checking is also not performed
    if [ $(unzip -Z1 $1 | grep -c -E 'a|b') -ne 2 ]; then # -Z1 lists the files in the zip archive 
        echo "Error: The zip file does not contain exactly two files with names a and b"
        exit 1
    fi

    unzip -qq $1 -d ./case/

    # check if the command was successful
    if [ $? -ne 0 ]; then
        echo "Error: Unable to unzip the file"
        exit 1
    fi

    file_content=$(<"./case/a")

    # Check if the content matches the pattern of one or more digits only
    if [[ !"$file_content" =~ ^[0-9]+$ ]]; then
        echo "Error: The file contains characters other than a number or is empty."
        exit 1
    fi

    file_content=$(<"./case/b")
    # Check if the content matches the pattern of one or more digits only
    if [[ !"$file_content" =~ ^[0-9]+$ ]]; then
        echo "Error: The file contains characters other than a number or is empty."
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
