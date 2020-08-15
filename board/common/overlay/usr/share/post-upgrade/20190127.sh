#!/bin/bash

# transform various variables in /data/etc/*.conf to uppercase

function to_uppercase() {
    IFS='='
    while read line; do
        if [[ -z "${line}" ]]; then
            echo
            continue
        fi
        parts=(${line})
        echo $(tr 'a-z' 'A-Z' <<< ${parts[0]})=${parts[1]}
    done
    unset IFS
}

function process_file() {
    # $1 - file path
    test -f $1 || return
    
    cat $1 | to_uppercase > $1.new
    mv $1.new $1
}

process_file /data/etc/os.conf
process_file /data/etc/watch.conf
process_file /data/etc/date.conf
process_file /data/etc/static_ip.conf

