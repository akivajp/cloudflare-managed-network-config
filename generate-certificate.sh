#!/bin/bash

set -e

# common functions
source ./common.sh

# parameters
CERT_DIR=${CERT_DIR:-./certs}
KEY_NAME=${KEY_NAME:-secret}
EXPIRE_DAYS=${EXPIRE_DAYS:-3650}
DOMAIN=${DOMAIN:-example.com}

show-info "CERT_DIR: ${CERT_DIR}"
show-info "KEY_NAME: ${KEY_NAME}"
show-info "EXPIRE_DAYS: ${EXPIRE_DAYS}"
show-info "DOMAIN: ${DOMAIN}"

key_path=${CERT_DIR}/${KEY_NAME}.key
cert_path=${CERT_DIR}/${KEY_NAME}.pem

if [ -f ${key_path} ]; then
    show-error "Key file already exists: ${key_path}"
    exit 1
fi

if [ -f ${cert_path} ]; then
    show-error "Certificate file already exists: ${cert_path}"
    exit 1
fi

if [ ! -d ${CERT_DIR} ]; then
    show-exec mkdir -p ${CERT_DIR}
fi

show-exec openssl req -x509 \
    -newkey rsa:4096 \
    -sha256 \
    -days ${EXPIRE_DAYS} \
    -nodes \
    -keyout ${key_path} \
    -out ${cert_path} \
    -subj "/CN=${DOMAIN}" \
    -addext "subjectAltName=DNS:${DOMAIN}:w"
