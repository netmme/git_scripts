#!/bin/sh

option="CORRECT_NAME=$1\n"
option="${option}CORRECT_MAIL=$2\n"
while IFS="" read -r line;
do
    option="${option}${line}\n"
done < ./swap_mails.sh

git filter-branch --env-filter ${option} --tag-name-filter cat -- --branches --tags

