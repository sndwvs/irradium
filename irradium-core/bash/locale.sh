#!/bin/sh
# Set the system locale.  (no, we don't have a menu for this ;-)
# For a list of locales which are supported by this machine, type:
#   locale -a

. /etc/rc.conf

# set default locale:
export LANG

# One side effect of the newer locales is that the sort order
# is no longer according to ASCII values, so the sort order will
# change in many places.  Since this isn't usually expected and
# can break scripts, we'll stick with traditional ASCII sorting.
# If you'd prefer the sort algorithm that goes with your $LANG
# setting, comment this out.
export LC_COLLATE=C

# End of /etc/profile.d/lacale.sh
