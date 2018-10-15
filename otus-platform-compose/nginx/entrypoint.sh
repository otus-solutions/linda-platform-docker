#!/bin/bash

cp ./nginx/sites-available/otus.template ./nginx/sites-enabled/otus.conf
cp ./nginx/sites-available/api-otus.template ./nginx/sites-enabled/api-otus.conf
cp ./nginx/sites-available/domain.template ./nginx/sites-enabled/domain.conf
cp ./nginx/sites-available/api-domain.template ./nginx/sites-enabled/api-domain.conf
cp ./nginx/sites-available/studio.template ./nginx/sites-enabled/studio.conf
cp ./nginx/sites-available/assets.template ./nginx/sites-enabled/assets.conf
# cp ./nginx/sites-available/localhost.template ./nginx/conf.d/default.conf

echo "OTUS HOST(default => otus.localhost)"
read otus
if [ -z $otus ]; then
    otus='otus.localhost'
fi

echo "DOMAIN HOST(default => domain.localhost)"
read domain
if [ -z $domain ]; then
    domain='domain.localhost'
fi

echo "STUDIO HOST(default => studio.localhost)"
read studio
if [ -z $studio ]; then
    studio='studio.localhost'
fi

echo "ASSETS HOST(default => assets.localhost)"
read assets
if [ -z $assets ]; then
    assets='assets.localhost'
fi

echo "OTUS API HOST(default => api-otus.localhost)"
read otus_api
if [ -z $otus_api ]; then
    otus_api='api-otus.localhost'
fi

echo "DOMAIN API HOST(default => api-domain.localhost)"
read domain_api
if [ -z $domain_api ]; then
    domain_api='api-domain.localhost'
fi

sed -i "s/localhost/$otus/g" ./nginx/sites-enabled/otus.conf
sed -i "s/localhost/$domain/g" ./nginx/sites-enabled/domain.conf
sed -i "s/localhost/$studio/g" ./nginx/sites-enabled/studio.conf
sed -i "s/localhost/$assets/g" ./nginx/sites-enabled/assets.conf
sed -i "s/localhost/$otus_api/g" ./nginx/sites-enabled/api-otus.conf
sed -i "s/localhost/$domain_api/g" ./nginx/sites-enabled/api-domain.conf
