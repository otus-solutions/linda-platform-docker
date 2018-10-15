#!/bin/bash
cp ./mongodb/example.js ./mongodb/otus-db-build.js
echo "PASSWORD Mongo Admin(default => XRYs9yjU): "
read passAdmin
if [ -z $passAdmin ]; then
    passAdmin='XRYs9yjU'
fi
echo "PASSWORD Mongo Otus(default => a9J1sVtL): "
read passOtus
if [ -z $passOtus ]; then
    passOtus='a9J1sVtL'
fi
echo "PASSWORD Mongo Domain(default => fLACLaFL): "
read passDomain
if [ -z $passDomain ]; then
    passDomain='fLACLaFL'
fi
sed -i "s/PASS_ADMIN/$passAdmin/g" ./mongodb/otus-db-build.js
sed -i "s/PASS_OTUS/$passOtus/g" ./mongodb/otus-db-build.js
sed -i "s/PASS_DOMAIN/$passDomain/g" ./mongodb/otus-db-build.js

