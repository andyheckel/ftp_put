#!/bin/bash
#small script to automatically upload a file to PeekNet. Takes one argument (the file name)

#read command for more secure ftp password entry. -p eliminates newline after
#prompt; -s stops shell from echoing terminal input.
file=$1
read -s -p "Please enter password: " password 


#uses ftp to connect to PeekNet. The -n switch is required to prevent autolog
#allowing you to manually quote user and password to the ftp server. All code between the END_SCRIPT is called in ftp.
ftp -n peeknet <<END_SCRIPT
quote USER andy
quote PASS $password
binary
put $file
quit
END_SCRIPT
exit 0

