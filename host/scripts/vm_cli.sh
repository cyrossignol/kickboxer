#!/usr/bin/env bash
#
# Kickboxer Virtual Machine Management Console CLI
#
# Cy Rossignol <cy@rossignols.me>
#

KICKBOXER="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../" && pwd )"

# Check to see if running under Cygwin on Windows
if [[ -z ${CYGDIR+x} ]]; then
    source "$KICKBOXER/host/scripts/functions"
else
    source "$(cygpath $KICKBOXER)/host/scripts/functions"
fi

vm_scripts="$(vm_path)/host/scripts"
vm_command_name="$1"
vm_command="${vm_scripts}/vm_${vm_command_name}.sh"

if [[ "$vm_command_name" == "" ]]; then

    if vm_load_adapter_for_vm "$2"; then
        source "${vm_scripts}/vm_start.sh" "$2"
        source "${vm_scripts}/vm_connect.sh" "$2"
    fi

elif [[ "$vm_command_name" == "help" ]]; then

    source "${vm_scripts}/vm_help.sh"

elif [[ -f "$vm_command" ]]; then

    if vm_load_adapter_for_vm "$2"; then
        source "${vm_command}" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9"
    fi

elif [[ "$vm_command_name" == "exit" ]]; then

    exit;

else

    source "${vm_scripts}/vm_help.sh"

fi
