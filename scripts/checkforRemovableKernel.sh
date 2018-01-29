#!/bin/bash
# http://ubuntuhandbook.org/index.php/2016/05/remove-old-kernels-ubuntu-16-04/
dpkg -l | tail -n +6 | grep -E 'linux-image-[0-9]+' | grep -Fv $(uname -r)
