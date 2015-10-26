#!/usr/bin/env bash
#
# Starts a virtual machine
#
# Cy Rossignol <cy@rossignols.me>
#

vm_current_state="$(vm_manage_show_status "$1")"

if [[ $vm_current_state == $VM_STATE_ON ]]; then
    vm_success "$1 is already running. Nothing to do."
elif [[ $vm_current_state == $VM_STATE_PAUSED ]]; then
    vm_success "$1 is paused. Resuming execution now..."
    vm_manage_resume "$1"
else
    vm_success "Starting ${1}..."
    vm_manage_start "$1"
fi
