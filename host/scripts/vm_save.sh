#!/usr/bin/env bash
#
# Pause the execution of a virtual machine
#
# Cy Rossignol <cy@rossignols.me>
#

vm_current_state="$(vm_manage_show_status "$1")"

if [[ $vm_current_state == $VM_STATE_ON ]]; then
    vm_success "Saving the state of ${1}..."
    vm_manage_save "$1"
else
    vm_fail "$1 is not running."
fi
