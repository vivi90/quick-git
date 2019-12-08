#!/bin/bash

#################################
# Usage:                        #
# "script.sh username password" #
# or                            #
# "script.sh"                   #
#################################

# Remote
REMOTE="origin"

# Gets the remote url
REMOTE_URL=$(git remote get-url --push "$REMOTE")

# Gets the current branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Gets the credentials
if [[ -z "$1" || -z "$2" ]]; then
	CREDENTIALS=$(zenity --title "Push current branch." --password --username)
else
	CREDENTIALS="$1|$2";
fi

# Push to remote
if [ ! -z "$CREDENTIALS" ]; then
	git push "${REMOTE_URL/"//"/"//"${CREDENTIALS/"|"/":"}"@"}" "$CURRENT_BRANCH"
fi

# Done
exit 0
