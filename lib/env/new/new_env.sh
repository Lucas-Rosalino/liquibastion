# ./lib/new/new.sh
#!/bin/bash

new_env() {
    if [ "$1" = "" ]; then 
        printf "teste"
        exit 1
    else 
        env_name=$LIQUIBASTION_ROOT_PATH/environments/$1.env 
        create_env 
    fi
}

create_env() {
    touch $env_name
    
    printf "Insert the database information: \n\n"
    read -p "Db Host: " dbHost 
    read -p "Db Name: " dbName
    read -p "Db User: " dbUser
    read -p "Db password: " dbPassword

    printf "\n\nInsert the host machine information: \n\n"
    read -p "Host/IP: " hostIp
    read -p "Host User: " hostUser
    read -p "Host public key path: " hostKeyPath
    printf "\n\n"

    printf "DB_HOST=$dbHost\nDB_NAME=$dbName\nDB_USER=$dbUser\nDB_PASSWORD=$dbPassword\nHOST_IP=$hostIp\nHOST_USER=$hostUser\nHOST_KEY_PATH=$hostKeyPath" > $env_name


    exit 0
}

