#!/bin/bash

echo "Content-type: text/html"


# Read session cookie

COOKIE_HEADER="$HTTP_COOKIE"
SESSION_ID=$(echo "$COOKIE_HEADER" | sed -n 's/.*SESSION_ID=\([^;]*\).*/\1/p')
echo ""

# Load session data
SESSION_FILE="cookie/session_$SESSION_ID"
if [ -f "$SESSION_FILE" ]; then
    USERNAME=$(grep 'username=' "$SESSION_FILE" | cut -d'=' -f2)
    ROLE=$(grep 'role=' "$SESSION_FILE" | cut -d'=' -f2)

    if [ "$ROLE" == "user" ]; then
        echo "<html><body><h1>Welcome, $USERNAME!</h1></body></html>"
        echo "<html><a href=/cgibash/logout.sh>logout</a>"
    else
        echo "<html><body><h1>Access Denied</h1></body></html>"
    fi
else
    echo "<html><body><h1>Session Expired. Please <a href='login.html'>login</a> again.</h1></body></html>"
fi


