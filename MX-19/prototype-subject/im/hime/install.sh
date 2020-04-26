#!/usr/bin/env bash

echo
echo 'apt-get install im-config $(apt-cache pkgnames hime)'
sudo apt-get install im-config $(apt-cache pkgnames hime)


echo
echo 'im-config -n hime'
im-config -n hime


echo
echo 'cat ~/.xinputrc'
cat ~/.xinputrc
