## Template for CheckMyLab Assignments
Assignments conists of test cases, solutions, reference solutions and several other scripts. Reference solutions are the instructor provided solutions that test cases are first run against. Each assignment needs a reference solution to run. Assignments can have multiple reference solutions, but only the newest one will be used for testing. This allows you to update the solution if necessary. This file is hidden from the solution, but they can submit test cases against it.

The assignment should also contain a script file to run the reference solution for the provided test case. This file can call a python file or any other file, so you can submit the runner in any format. The assignment uses seperate runner for running the student's solution, and it can be the same file as the reference runner. Additionally, if your assignment requires compiling the code before usage, you may submit another script.  More details about the i/o and usage are provided below. 

The assignment also contains a validator to ensure that test case is formatted properly and doesn't contain any bad information. As everyone can view other test cases (depending on the assignment), this is important.

Refer to this document for the specifications of the folder. Once you have all these files ready, you may upload the files to CheckMyLab.Not all of the files are required. CheckMyLab will automatically look for the right settings based on the files provided. 

## Folder Structure
Your folder structure should match the format as provided below. You can either zip the folder or upload each files manually to the server. * means required file.
```
.
└── Form
    ├── reference.data*
    │
    ├── solutionRunner.sh*
    ├── studentRunner.sh*
    │    
    ├── testCasePreChecker.sh
    ├── customValidator.sh
    │
    ├── solutionCompiler.sh
    ├── studentCompiler.sh
    │
    └── helpers.zip
        └──  .txt, .py, .c, etc. (any additional files you need)

```
You may upload additional files inside helpers.zip. You aren't required to name these files in the provided manner, we will rename the files for you. 



1.  `solutionRunner.sh`: Bash script to generate the expected output. We use arguments to provide file path for the input and the output file paths.
If you're using a custom validator (mentioned below) this file is still required since any uploaded test case will be ran through it as a baseline check for any errors.
2.  `studentRunner.sh`: Bash script that will run the student's solution. You can submit a python file in the zipped folder and have it easily run from the script file.

Please note that the file names are not guaranteed to be the same as when they were uploaded. Due to this, you must use the arguments in the runner and validation scripts.

## Validator Script

By default, CheckMyLab will use its built-in `diff` validator to verify whether user outputs align with the expected outputs. Alternatively, you can create develop your own validator inside `customValidator.sh`. These script is expected to exit with a non-zero status to indicate an incorrect student solution. An example valdiator is also provided here.
3.  `customValidator.sh`, which is ran to determine if a submission passes or fails.


Each uploaded test will be discarded if 
1.  It is over the maximum size (defined when you create the assignment); or
2.  If it causes an error while being ran through the reference solution.
Optionally, you can also include `testCasePreChecker.sh` which will be ran to determine if an uploaded test case is valid (doesn't contain offensive words, etc.). This is built based on our experience that students used to mistake this for uploading their solutions. You can write your own script to verify if it's the solution and verify if it is actually a test case. 

### Example Validator
TODO

## Compiler Script
If the solution and submissions require compilation, then you can upload these scripts:

4.  `solutionCompiler.sh`, to compile the reference soltuion;
5.  `studentCompiler.sh`, to compile each submission;

These compilation scripts can be as simple as running a make target that students write in the assignment.


## Additional Flags
Additionally, you set some flags on the page where you upload the zip file. Most of them are optional.
These are:
1. Assignment Title and Description, Due Dates, Course name, etc. will be asked
2. Visibility of the tests (Collaborative/Competitive)*
3. Maximum size for the uploaded testcase (512kB by default) 


### Visibility of Tests
There two options for the visibility of tests.
1.  Collaborative:  Students can see all other students tests cases. This is the default.
2.  Competitive:    Students can only see their own test cases and those given by the admins of the course.


## Uploading Test Cases
You can upload test cases inside the `tests` folder. We will generate the outputs automatically for you. Alternatively, of you wish to add tests later, you may have to upload them through the site.
