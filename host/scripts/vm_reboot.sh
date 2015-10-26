#!/usr/bin/env bash
#
# Pause the execution of a virtual machine
#
# Cy Rossignol <cy@rossignols.me>
#

source "$(vm_path)/host/scripts/vm_shutdown.sh" "$1"

while [[ $(vm_manage_show_status "$1") != $VM_STATE_OFF ]]
do
    sleep 2
done

source "$(vm_path)/host/scripts/vm_start.sh" "$1"
