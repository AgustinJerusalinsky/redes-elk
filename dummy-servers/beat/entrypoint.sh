#!/bin/bash

# funcion para verificar si el servicio está en ejecución
check_service() {
    service_name=$1
    port=$2

    nc -z -w1 $service_name $port >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Service: $service_name. Port: $port. Status: UNAVAILABLE."
    fi
}

# heart beat cada 5s con 1s de timeout
while true; do
    check_service $DATABASE_SERVER 5432
    check_service $LINUX_SERVER 22
    check_service $WEB_SERVER 8000
    sleep 5
done
