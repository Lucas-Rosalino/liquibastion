# ./lib/new/new.sh
#!/bin/bash

update_command() {
    source $LIQUIBASTION_ROOT_PATH/environments/$1.env
    create_ssh_tunnel $@
}

create_ssh_tunnel() {
    ssh -o ExitOnForwardFailure=yes -f -L 5433:$DB_HOST:5432 $HOST_USER@$HOST_IP -i $HOST_KEY_PATH sleep 15

    connect $@
}

connect () {
    url=jdbc:postgresql://localhost:5433/$DB_NAME
    liquibase --url=$url --username=$DB_USER --password=$DB_PASSWORD --driver=org.postgresql.Driver --changelog-file=$2 update
}