#!/usr/bin/env bash
#
# Open a window to show the display of a virtual machine
#
# Cy Rossignol <cy@rossignols.me>
#

vm_current_state="$(vm_manage_show_status "$1")"

if [[ $vm_current_state == $VM_STATE_ON ]]; then
    vm_success "Preparing to show the display of ${1}..."
    vm_manage_save "$1"
    vm_success "Starting the VM GUI. You may need to press a key if the screen"
    vm_success "is black..."
    vm_manage_start_gui "$1"
else
    vm_fail "$1 is not running."
fi
