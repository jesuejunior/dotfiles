#!/bin/bash

RESOURCEGROUP=$1
HOSTNAME=$2
SSHUSER="loggi"

if [[ -z ${RESOURCEGROUP} ]] || [[ -z ${HOSTNAME} ]]; then
    echo "Usage: $(basename "$0") [resource group] [hostname]..."
    exit 0
fi

echo "Searching for ${HOSTNAME} on resource group \"${RESOURCEGROUP}\" ..."
HOST=$(az vm list-ip-addresses -g $1 -n $2 --query '[0].virtualMachine.network.privateIpAddresses[0]' -o tsv)

if [[ -z ${HOST} ]]; then
    echo "${HOSTNAME} not found on resource group \"${RESOURCEGROUP}\""
    exit 1
fi

echo "Connecting to ${HOSTNAME} ..."
ssh ${SSHUSER}@${HOST}
