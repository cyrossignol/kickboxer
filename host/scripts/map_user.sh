#!/usr/bin/env bash
#
# Maps Windows account information to UNIX accounts
#
# Cy Rossignol <cy@rossignols.me>
#

# Gather Windows account information...
USER_INFO="$( /usr/bin/mkpasswd -c )"
GROUP_INFO="$( /usr/bin/mkgroup -c )"
USER_SID="$( echo $USER_INFO | /usr/bin/gawk -F":" '{ print $5 }' )"
GROUP_ID="$( echo $USER_INFO | /usr/bin/gawk -F":" '{ print $4 }' )"
GROUP_SID="$( echo $GROUP_INFO | /usr/bin/gawk -F":" '{ print $2 }' )"

# Map Windows account to UNIX account
echo "$CYGUSER:*:1001:$GROUP_ID:$USER_SID:$CYGHOME:$SHELL" > /etc/passwd
echo "$GROUP_INFO" > /etc/group
