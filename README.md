# GIT-SCRIPTS

## How to use it

Create a file `mails.txt` and fill it with all the mails you want to change.

Create a file `repositories.txt` and fill it with all the repositories you want
to edit

Execute the script form th git_scripts repository

`rename-mails/renameall.sh USERNAME CORRECT_USERNAME CORRECT_EMAIL`

Enter your username and password when git asks so.

## Improvement

Use absolute path to deal with all the meli-melo.

## Bug

swap_mails is correctly pass as an argument but it seems that it cant iterate
on the mails.txt file.
