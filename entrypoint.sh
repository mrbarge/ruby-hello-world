#!/bin/sh

export USER_ID=$(id -u)
export GROUP_ID=$(id -g)
grep -v -e ^default -e ^$USER_ID /etc/passwd > "$HOME/passwd"
echo "default:x:${USER_ID}:${GROUP_ID}:Default Application User:${HOME}:/sbin/nologin" >> "$HOME/passwd"
export LD_PRELOAD=libnss_wrapper.so
export NSS_WRAPPER_PASSWD=${HOME}/passwd
export NSS_WRAPPER_GROUP=/etc/group

whoami > /opt/app-root/src/whoami
ls -la /hello > /opt/app-root/src/thels

/usr/bin/scl enable rh-ruby25 /opt/app-root/src/run.sh
