# ./config/install.sh
#!/bin/bash

script_pwd=$(pwd)
if [ -d /usr/local/bin/liquibastion-files ]; then
    echo "liquibastion is already installed on this machine"
else
    mkdir -p /usr/local/bin/liquibastion-files && cd /usr/local/bin/liquibastion-files
    printf "Installing liquibastion"
    sleep 1
    printf " ."
    sleep 1
    printf " ."
    sleep 1
    printf " ."
    sleep 1
    printf "\n"
    
    mkdir lib
    mkdir environments
    
    cp -r $script_pwd/lib/* ./lib
    cp $script_pwd/liquibastion .
    cp $script_pwd/liquibastion ..
    chmod 755 ../liquibastion
    
    printf "Install complete\n"
fi
