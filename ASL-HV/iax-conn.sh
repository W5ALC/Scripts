#!/bin/bash

# script that lists my iax peer list

# awk -F '[][]' '{print $2}' /etc/asterisk/iax.conf | grep -v '^[[:space:]]*$' | sed 's|general||' | sed 's|radio-proxy||' | sed 's|-out||' | sed 's|iaxrpt||' | sed 's|pbx||' | sed 's|radio||' | sed 's|-control||' | sed 's|allstar-sys||' | sed 's|allstar-public||' | sed 's|yourprovider||' | grep -v '^[[:space:]]*$'


# new command same reult

asterisk -rx "iax2 show peers" | grep -v "Username" | grep -v "iax2" | awk '{ print $1 }'
