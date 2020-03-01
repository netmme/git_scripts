#!/bin/sh

option_header="CORRECT_NAME=$1\n"
option_header="${option_header}CORRECT_MAIL=$2\n"

option_footer=""
while IFS="" read -r line;
    do
        option_footer="${option_footer}${line}\n"
done < ./swap_mails.sh

while IFS="" read -r old_email;
do
    option="${option_header}old_email=${old_email}\n"
    option="${option}${option_footer}"
    option='$option'
    git filter-branch --env-filter $option --tag-name-filter cat -- --branches --tags
done < ../../data/mails.txt
