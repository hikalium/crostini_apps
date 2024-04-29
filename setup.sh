#!/bin/bash -e
APP_DIR="$(dirname ${BASH_SOURCE[0]})"
BIN_DIR="${APP_DIR}"/bin/
mkdir -p "${BIN_DIR}"
BIN_DIR=$(readlink -f "${BIN_DIR}")
echo "${BIN_DIR}"
