#!/bin/bash

USER="masterccc"

for depot in "projet1" "projet2"
do
	git clone --bare "https://github.com/${USER}/${depot}"
	cd "${depot}.git"
	cp ../gitscript.sh .
	./gitscript.sh
	git push --force --tags origin 'refs/heads/*'
	cd ..
done

