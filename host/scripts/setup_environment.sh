#!/usr/bin/env bash
#
# Creates the environment for the VM Console
#
# Cy Rossignol <cy@rossignols.me>
#

# Copy files..
vm_home_dir="$(/usr/bin/cygpath $CYGHOME)"
vm_profile_dir="$(/usr/bin/cygpath $KBHOST)/profile"

if [ ! -d "${vm_home_dir}" ]; then
    /bin/mkdir -p "${HOME}"
fi

/bin/cp "$vm_profile_dir/bash_profile.vmhost" "$vm_home_dir/.bash_profile"
/bin/cp "$vm_profile_dir/minttyrc" "$vm_home_dir/.minttyrc"
