#!/usr/bin/env bash
#
# Pause the execution of a virtual machine
#
# Cy Rossignol <cy@rossignols.me>
#

VM_USERNAME="kickboxer"
VM_HOSTNAME="localhost"
VM_PORT=2200

vm_success "Connecting to ${1}..."

ssh -p $VM_PORT "${VM_USERNAME}@${VM_HOSTNAME}"
