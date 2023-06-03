#setup password for kibana_system, logstash_system and beats_system with curl

USERS=("kibana_system"  "logstash_system"  "beats_system")

for USER in "${USERS[@]}"
do
    echo "Setting password for $USER"
    curl "elasticsearch:9200/_security/user/$USER/_password" -u elastic:elastic -H 'Content-Type: application/json' -d '{
        "password" : "elastic"
    }'
done