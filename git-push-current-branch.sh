#!/bin/bash

# Remote
REMOTE="origin"

# Gets the remote url
REMOTE_URL=$(git remote get-url --push "$REMOTE")

# Gets the current branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Gets the credentials
CREDENTIALS=$(zenity --title "Push current branch." --password --username)

# Push to remote
if [ ! -z "$CREDENTIALS" ]; then
	git push "${REMOTE_URL/"//"/"//"${CREDENTIALS/"|"/":"}"@"}" "$CURRENT_BRANCH"
fi

# Done
exit 0
