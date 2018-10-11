#!/bin/bash

cp /etc/nginx/sites-available/otus.template /etc/nginx/sites-enabled/otus.conf
cp /etc/nginx/sites-available/api-otus.template /etc/nginx/sites-enabled/api-otus.conf
cp /etc/nginx/sites-available/domain.template /etc/nginx/sites-enabled/domain.conf
cp /etc/nginx/sites-available/api-domain.template /etc/nginx/sites-enabled/api-domain.conf
cp /etc/nginx/sites-available/studio.template /etc/nginx/sites-enabled/studio.conf
cp /etc/nginx/sites-available/assets.template /etc/nginx/sites-enabled/assets.conf
cp /etc/nginx/sites-available/localhost.template /etc/nginx/conf.d/default.conf

sed -i "s/localhost/$OTUS_HOST/g" /etc/nginx/sites-enabled/otus.conf
sed -i "s/localhost/$OTUS_API_HOST/g" /etc/nginx/sites-enabled/api-otus.conf
sed -i "s/localhost/$DOMAIN_HOST/g" /etc/nginx/sites-enabled/domain.conf
sed -i "s/localhost/$DOMAIN_API_HOST/g" /etc/nginx/sites-enabled/api-domain.conf
sed -i "s/localhost/$STUDIO_HOST/g" /etc/nginx/sites-enabled/studio.conf
sed -i "s/localhost/$ASSETS_HOST/g" /etc/nginx/sites-enabled/assets.conf
