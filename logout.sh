#!/bin/bash

echo "Content-type: text/html"
echo "Set-Cookie: SESSION_ID=0; Path=/; HttpOnly"
echo ""
        echo "<html>"
        echo "<head><meta http-equiv='refresh' content='0; URL=login.html'></head>"
        echo "<body></body></html>"

