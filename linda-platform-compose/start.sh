#!/bin/bash
DARKGRAY='\033[1;30m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

printf "\n\n * * * POSTGRES * * * \n"
printf "Password POSTGRES (default =${YELLOW} kg7CknsvzCVkk7Sd${NC}):\n"
read passPostgres
if [ -z $passPostgres ]; then
    passPostgres='kg7CknsvzCVkk7Sd'
fi

printf "\n\n * * * WILDFLY * * * \n"
printf "User Wildfly (default =${YELLOW} admin${NC}):\n"
read user_wildfly
if [ -z $user_wildfly ]; then
    user_wildfly='admin'
fi

printf "Password Wildfly (default =${YELLOW} DFQ3JY1lwUxjeLgu${NC}):\n"
read pass_wildfly
if [ -z $pass_wildfly ]; then
    pass_wildfly='DFQ3JY1lwUxjeLgu'
fi

printf "Disable Debug Mode(y/n): "
read debug
case $debug in
    y)
        printf "${RED}DEBUG MODE DISABLED${NC}\n"
        ;;
    *)
        printf "DEBUG MODE ENABLED\n"
        ;;
esac
printf "\n\n * * * NGINX * * * \n"
printf "Host NGINX (default =${YELLOW} localhost${NC}):\n"
read hostname
if [ -z $hostname ]; then
    hostname='localhost'
fi

sudo docker-compose down
printf "${DARKGRAY}#############${NC} NGINX${DARKGRAY} #############${NC}\n"
printf "${GREEN}Criando o host principal (default.conf)...\n"
cp ./nginx/sites-available/default.template ./nginx/default.conf
sleep 1
printf "Atualizando server name...\n"
sed -i "s/localhost/$hostname/g" ./nginx/default.conf
sleep 1

printf "\n[COMPLETO]\n"
printf "${NC}\n\n"

printf "${DARKGRAY}#############${NC} WILDFLY${DARKGRAY} #############${NC}\n"
printf "${GREEN}Limpando diretório persistence...\n"
sudo rm -rf wildfly/persistence/wildfly
sleep 1
printf "Importando configurações necessárias...\n"

case $debug in
    y)
        mkdir -p ./wildfly/persistence/wildfly/bin
        ;;
    *)
        mkdir -p ./wildfly/persistence/wildfly/bin
        cp ./wildfly/config/standalone.conf ./wildfly/persistence/wildfly/bin/standalone.conf
        ;;
esac
mkdir -p ./wildfly/persistence/wildfly/conf
cp ./wildfly/config/standalone.xml ./wildfly/persistence/wildfly/conf/standalone.xml
sleep 1

printf "Atualizando usuário administrador...\n"
sed -i -E "s/WILDFLY_USER=.+/WILDFLY_USER=$user_wildfly/g" .env
sed -i -E "s/WILDFLY_PASS=.+/WILDFLY_PASS=$pass_wildfly/g" .env
sleep 1
printf "\n[COMPLETO]\n\n\n"

printf "${DARKGRAY}#############${NC} POSTGRES${DARKGRAY} #############${NC}\n"
printf "${GREEN}Alterando a senha...\n"
sed -i -E "s/kg7CknsvzCVkk7Sd/$passPostgres/g" ./wildfly/persistence/wildfly/conf/standalone.xml
sed -i -E "s/kg7CknsvzCVkk7Sd/$passPostgres/g" .env
sleep 1
printf "\n[COMPLETO]\n"





printf "${NC}\n\n${BLUE}FIM DA CONFIGURAÇÃO${BLUE}\n\n${NC}"

sudo docker-compose up -d
sudo docker ps
sudo chmod -R 777 ./wildfly/persistence/
