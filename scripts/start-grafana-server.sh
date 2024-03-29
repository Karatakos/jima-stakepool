#!/usr/bin/env bash

export GF_PATHS_CONFIG="/home/docker/node/config/monitoring/grafana/grafana.ini"
export GF_PATHS_DATA="/home/docker/node/config/monitoring/grafana/data"
export GF_PATHS_HOME="/usr/share/grafana"
export GF_PATHS_LOGS="/home/docker/node/logs/grafana"
export GF_PATHS_PLUGINS="/var/lib/grafana/plugins"
export GF_PATHS_PROVISIONING="/etc/grafana/provisioning"
export GF_HOMEPATH="/home/docker/node/config/monitoring/grafana"

export GF_SECURITY_ADMIN_USER="$GRAFANA_ADMIN_USER"
export GF_SECURITY_ADMIN_PASSWORD="$GRAFANA_ADMIN_PASSWORD"

mkdir -p $GF_PATHS_LOGS

pm2-runtime start grafana-server -- --config $GF_HOMEPATH/grafana.ini --homepath $GF_PATHS_HOME cfg:default.paths.logs=$GF_PATHS_LOGS
