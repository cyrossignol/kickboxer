#!/usr/bin/env bash
#
# Set up a bash environment to run kickboxer commands from a CLI
#
# Cy Rossignol <cy@rossignols.me>
#

export KICKBOXER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

/usr/bin/env bash --rcfile "$KICKBOXER/host/profile/bash_profile.vmhost" -i
