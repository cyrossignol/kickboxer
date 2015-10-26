#!/usr/bin/env bash
#
# Kickboxer Virtual Machine Management Console CLI
#
# Cy Rossignol <cy@rossignols.me>
#

# Choose the virtualization platform (only VirtualBox supported at this time)
source "$(vm_path)/host/scripts/vbox_adapter"

if ! vm_host_exists; then
    echo "Could not find Virtual Machine Host Application ${VM_HOST_APP}."
    vm_handle_missing_host_app
fi

if ! vm_manager_exists; then
    echo "Could not find Virtual Machine Manager Application ${VM_MANAGER}."
    vm_handle_missing_host_app
fi
