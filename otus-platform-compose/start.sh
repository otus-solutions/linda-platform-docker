#!/bin/bash
./mongodb/entrypoint.sh
./nginx/entrypoint.sh
echo "User Wildfly Admin(default => admin)"
read user_wildfly
if [ -z $user_wildfly ]; then
    user_wildfly='admin'
fi
echo "Password Wildfly Admin(default => rBQqsMXU)"
read pass_wildfly
if [ -z $pass_wildfly ]; then
    pass_wildfly='rBQqsMXU'
fi
sed -i -E "s/WILDFLY_USER=.+/WILDFLY_USER=$user_wildfly/g" .env
sed -i -E "s/WILDFLY_PASS=.+/WILDFLY_PASS=$pass_wildfly/g" .env
sudo docker-compose up -d
