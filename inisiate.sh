#!/bin/bash

# MAINTAINER: LEON
# 09 September 2022

## Verification User

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Remove previous binary
remove() {
rm -fv /usr/bin/batchlepas
rm -fv /usr/bin/lepasproject
rm -fv /usr/bin/switchproject
rm -fv /usr/bin/tempelproject
rm -fv /usr/bin/nc-data
}

install() {
# Get your path git
path=$PWD
echo "Saat ini berada pada directory $path";

# Get in tools
cd tools; ls -lah

# Change permission
echo "Change permission tools ====>"
chmod +x $path/tools/*

ls -lah $path/tools/

# Make binary for tools
echo ""
echo "Send tool to binary path ====>"
mv $path/tools/batchlepas.sh /usr/bin/batchlepas -v
mv $path/tools/lepasproject.sh /usr/bin/lepasproject -v
mv $path/tools/switchproject.sh /usr/bin/switchproject -v
mv $path/tools/tempelproject.sh /usr/bin/tempelproject -v
mv $path/tools/nc-data.sh /usr/bin/nc-data -v

#Check
echo "Tes command baru ===>"
which batchlepas
which lepasproject
which switchproject
which tempelproject
which nc-data
echo ""
echo "Inisiate Done, Please refer to : https://github.com/leonyonz/Openstack-Tools"
}

OPTION=$1
case "$OPTION" in
    -h|--help)
      echo "-i --install: Install tools
      -r --remove: remove tools
      -h --help: Munculkan bantuan";
      ;;
    -i|--install)
      install;
      ;;
    -r|--remove)
      remove;
      ;;
    *)
      echo "script usage: [-i|--install] [-h|--help] [-r|--remove]" >&2
      exit 1
      ;;
 esac