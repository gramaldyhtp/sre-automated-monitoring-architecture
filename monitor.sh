#!/bin/bash

# Trik SRE: Cron berjalan di environment terbatas, jadi kita harus mendefinisikan PATH
# agar sistem mengenali perintah 'docker'
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

URL="http://172.18.0.3:5000"
STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
DIR="/home/gramaldy/compose-demo"

if [ "$STATUS" -eq 200 ]; then
    echo "[$TIMESTAMP] - SUCCESS: Application is UP (Heartbeat OK - Status 200)"
else
    echo "[$TIMESTAMP] - CRITICAL: Application is DOWN! (Status $STATUS). Initiating Self-Healing..."
    
    # Masuk ke folder proyek dan restart service web
    cd $DIR && docker compose restart web
    
    echo "[$TIMESTAMP] - RECOVERY: Docker container restarted automatically."
fi
