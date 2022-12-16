#!/bin/bash

#############################################
## install instantASSIST from a local copy ##
#############################################

pushd .

die() {
    echo "exiting: $1"
    exit 1
}

if [ -z "${ASSISTPREFIX}" ]; then
    whoami | grep -q '^root$' || die "not running as root"
fi

rm -rf /tmp/assistinstall
mkdir /tmp/assistinstall

{
    [ -e assists ] && [ -e instantassist.desktop ]
} || die "not running from repo"

cp -r ./* /tmp/assistinstall
cd /tmp/assistinstall || die "failed to create tmp file"

git pull

[ -e "${ASSISTPREFIX}"/usr/bin ] || mkdir -p "${ASSISTPREFIX}"/usr/bin
[ -e "${ASSISTPREFIX}"/usr/share/instantassist ] || mkdir -p "${ASSISTPREFIX}"/usr/share/instantassist

# remove old version
if [ -e "${ASSISTPREFIX}"/usr/share/instantassist ]; then
    rm -rf "${ASSISTPREFIX}"/usr/share/instantassist
fi

mkdir -p "${ASSISTPREFIX}"/usr/share/instantassist
mkdir -p "${ASSISTPREFIX}"/usr/bin

./cache.sh
chmod -R 755 cache

echo "installing instantassist binary"

chmod 755 instantassist
chmod 755 instantrepeat
cp instantassist "${ASSISTPREFIX}"/usr/bin/instantassist
cp instantrepeat "${ASSISTPREFIX}"/usr/bin/instantrepeat

echo "pwd"
pwd
echo "ls"
ls

rm -rf ./.git
rm install.sh
rm ./*.md

chmod 755 ./assists/*/*.sh
chmod 755 ./assists/*.sh
chmod 755 ./utils/*.sh

installdir() {
    echo "installing dir $1"
    mkdir -p "${ASSISTPREFIX}"/usr/share/instantassist/"$1"
    cp -r "$1"/* "${ASSISTPREFIX}"/usr/share/instantassist/"$1"/
}

installdir cache
installdir assists
installdir data
installdir utils

[ -z "${ASSISTPREFIX}" ] && rm -rf /tmp/assistinstall

popd || exit 1
