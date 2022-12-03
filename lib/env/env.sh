# ./lib/new/new.sh
#!/bin/bash

source $LIQUIBASTION_ROOT_PATH/lib/env/new/new_env.sh

env() {
    case $1 in
    new)
        shift
        new_env $@
        ;;
    list)
        printf "Listing all environments:\n\n"

        for entry in $LIQUIBASTION_ROOT_PATH/environments/*
        do
            filename=${entry##*/}
            printf "    ${filename%.*}\n"
        done

        printf "\n"
        exit 0
        ;;
    *)
        printf "Error choose an option and try again:\n"
        printf "    new: liquibastion env new <environment_name>\n\n"
        exit 1
        ;;
    esac
}