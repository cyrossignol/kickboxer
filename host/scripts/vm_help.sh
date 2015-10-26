#!/usr/bin/env bash
#
# Print the help menu for the Virtual Machine CLI
#
# Cy Rossignol <cy@rossignols.me>
#

printf "${vm_green}"
echo "
Kickboxer VM Console CLI - Help

    help            Display this help message."

if [[ $(vm_get_current_os) == $VM_WINDOWS_OS ]]; then
    echo -n "
    exit            Exit the console. VMs continue to run in the background.
    "
fi

echo "
    list            Display a list of available VMs.
    running         Display a list of running VMs.

Machine control commands are:

    status          Show the current state of a VM.
    info            Get detailed information about a VM.

    start           Boot or resume (unpause) the VM.
    pause           Suspend the execution of the VM.
    save            Save the current VM state and power off the VM.
    discard         Delete previously saved state. The next boot will be fresh.
    shutdown        Shutdown the VM. Sends shutdown signal to the guest OS.
    reboot          Reboot the vm. Sends reboot signal to the guest OS.
    stop            Power off the VM. Like pulling the plug.
    reset           Power cycles the VM. Like pressing the reset button.

    connect         Connect to the VM through SSH.
    show            Open a window to show the display of the VM.

    reconfigure     Reload the configuration file for the VM.

    snap [name]     Create a snapshot of the current execution state.
    load [name]     Load a previously saved snapshot into the current VM.
    snapshots       List any saved snapshots.

Usage: command [vm_name] [snapshot_name (for snap and load commands)]

If no virtual machine name is specified, the command operates on the last used
virtual machine. The name of this VM is dispalyed on the prompt (Windows only).

Executing this command without any arguments is a shortcut for 'start' (only if
the VM is not running), followed by 'connect'.
"
printf "${vm_color_off}"
