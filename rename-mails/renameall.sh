#!/bin/bash

USER="$1"
CORRECT_USER="$2"
CORRECT_MAIL="$3"
WORK_DIR="$PWD"
DATA_DIR="$WORK_DIR/data"
TMP_DIR="$WORK_DIR/tmp"

echo "Starting renaming!"
mkdir "${TMP_DIR}"

while IFS="" read -r depot;
do
	echo "Cloning ${depot}..."
	depot_dir="$TMP_DIR/$depot"
	git clone --bare "https://github.com/${USER}/${depot}" "${depot_dir}"
	cp ./rename-mails/gitscript.sh "${depot_dir}"
	cp ./rename-mails/swap_mails.sh "${depot_dir}"
	cd "${depot_dir}"

	echo "Renaming ${depot}..."
	./gitscript.sh $CORRECT_USER $CORRECT_MAIL
	git push --force --tags origin 'refs/heads/*'
	cd $WORK_DIR

	echo "${depot} renamed!"
done < $DATA_DIR/repositories.txt

echo "Removing depositories..."
rm -rf $TMP_DIR

echo "...Ending renaming"
