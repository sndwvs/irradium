#!/bin/sh
# Check if /sys/fs/fuse/connections is already mounted, mount it otherwise
if mountpoint -q /sys/fs/fuse/connections; then
    exit 0
fi
exec /bin/mount -t fusectl fusectl /sys/fs/fuse/connections
