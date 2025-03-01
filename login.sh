#!/bin/bash

echo "Content-type: text/html"

# Generate a new SESSION_ID
SESSION_ID=$(uuidgen)

# Set the cookie BEFORE any output
echo "Set-Cookie: SESSION_ID=$SESSION_ID; Path=/; HttpOnly"
echo ""

# Set session folder
SESSION_DIR="./cookie"

# Read POST data
read INPUT_DATA
USERNAME=$(echo "$INPUT_DATA" | sed -n 's/.*username=\([^&]*\).*/\1/p' | tr -d '\r')
PASSWORD=$(echo "$INPUT_DATA" | sed -n 's/.*password=\([^&]*\).*/\1/p' | tr -d '\r')

# Hash password (MUST MATCH THE DATABASE HASH METHOD)
PASSWORD_HASH=$(echo -n "$PASSWORD" | sha256sum | awk '{print $1}')

# Validate user credentials using SQLite
DB_PATH="./db/database.db"
USER_INFO=$(sqlite3 "$DB_PATH" "SELECT role FROM users WHERE username='$USERNAME' AND password_hash='$PASSWORD_HASH';")

# If user exists, create session
if [ -n "$USER_INFO" ]; then
    SESSION_FILE="$SESSION_DIR/session_$SESSION_ID"

    # Store session data
    echo "username=$USERNAME" > "$SESSION_FILE"
    echo "role=$USER_INFO" >> "$SESSION_FILE"
    chmod 600 "$SESSION_FILE"

    # Redirect user based on role
    if [ "$USER_INFO" == "admin" ]; then
        #echo "Location: admin_dashboard.sh"
        echo "<html>"
        echo "<head><meta http-equiv='refresh' content='0; URL=admin_dashboard.sh'></head>"
        echo "<body></body></html>"
    else
        #echo "Location: user_dashboard.sh"
        echo "<html>"
        echo "<head><meta http-equiv='refresh' content='0; URL=user_dashboard.sh'></head>"
        echo "<body></body></html>"
    fi
    echo ""
else
    echo ""
    echo "<html><body><h1>Invalid credentials</h1></body></html>"
fi



