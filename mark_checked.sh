#!/bin/bash -e
cd "$(dirname ${BASH_SOURCE[0]})"
cat /opt/google/cros-containers/etc/lsb-release | tee checked_version.txt
