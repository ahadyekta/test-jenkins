#!/bin/sh            
 cd /test-jenkins <<EOF 
 git pull       
 npm install      
./node_modules/.bin/pm2 start app.js
 exit       
EOF