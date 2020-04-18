#!/usr/bin/bash -xe

sudo apt-get install openjdk-8-jdk-headless

user=craft
dir=/opt/mcserver

id -u ${user} >/dev/null 2>&1 || useradd -r -s /bin/false ${user}

mkdir -p ${dir} || echo "Server directory already exists"
chown -R ${user}:${user} ${dir}

curl -Lo /opt/server.jar https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
