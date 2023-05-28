#!/bin/bash

cd /app/filebeat-7.17.10-linux-x86_64 && ./filebeat -e &
uvicorn main:app --host 0.0.0.0 --port 8000
