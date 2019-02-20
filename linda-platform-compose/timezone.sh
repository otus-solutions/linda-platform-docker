#!/bin/bash
$TZ="America/Sao_Paulo"
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
echo $TZ > /etc/timezone
