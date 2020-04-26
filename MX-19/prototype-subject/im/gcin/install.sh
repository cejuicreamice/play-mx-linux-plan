#!/usr/bin/env bash

echo
echo 'sudo apt-get install im-config $(apt-cache pkgnames gcin)'
sudo apt-get install im-config $(apt-cache pkgnames gcin)


echo
echo 'im-config -n gcin'
im-config -n gcin


echo
echo 'cat ~/.xinputrc'
cat ~/.xinputrc
