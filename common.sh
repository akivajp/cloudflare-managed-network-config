#!/bin/bash

clear="\033[0m"
red="\033[31m"
yellow="\033[33m"
cyan="\033[36m"

# show command before executing
show-exec() {
    timestamp=$(date "+%Y/%m/%d %H:%M:%S")
    echo -e "${yellow}[exec at ${timestamp}] $@${clear}"
    eval "$@"
}

# show info message
show-info() {
    timestamp=$(date "+%Y/%m/%d %H:%M:%S")
    echo -e "${cyan}[info at ${timestamp}] $@${clear}"
}

# show error message
show-error() {
    timestamp=$(date "+%Y/%m/%d %H:%M:%S")
    echo -e "${red}[error at ${timestamp}] $@${clear}"
}