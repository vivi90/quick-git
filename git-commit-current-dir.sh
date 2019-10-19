#!/bin/bash

# UI dialog.
description=$(zenity --title "Commit all changes in the current directory." --entry --text "Please enter the description:")

# Git commit.
if [ ! -z "$description" ]; then
	git add .
	git commit -m "$description"
fi

# Done.
exit 0
