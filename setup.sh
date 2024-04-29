#!/bin/bash -e
APP_DIR="$(dirname ${BASH_SOURCE[0]})"
BIN_DIR="${APP_DIR}"/bin/
mkdir -p "${BIN_DIR}"
BIN_DIR=$(readlink -f "${BIN_DIR}")
echo "${BIN_DIR}"

function download_appimage() {
	APP_NAME="$1"
	BIN_URL="$2"
	BIN_BASENAME=$(basename "${BIN_URL}")
	BIN_PATH="${BIN_DIR}/${BIN_BASENAME}"
	echo ${APP_NAME} ${BIN_BASENAME}
	wget -nc -P "${BIN_DIR}" "${BIN_URL}"
	chmod 755 "${BIN_PATH}"
}

function download_tar_xz() {
	APP_NAME="$1"
	TAR_URL="$2"
	TAR_BASENAME=$(basename "${TAR_URL}")
	TAR_PATH="${BIN_DIR}/${TAR_BASENAME}"
	UNPACK_DIR="${TAR_PATH}_unpacked"
	echo ${APP_NAME} ${TAR_BASENAME}
	wget -nc -P "${BIN_DIR}" "${TAR_URL}"
	ls -lah "${TAR_PATH}"
	if ! [ -d "${UNPACK_DIR}" ] ; then
		echo "Unpacking..."
		mkdir -p "${UNPACK_DIR}"
		tar -xf "${TAR_PATH}" -C "${UNPACK_DIR}"
	else
		echo "Unpacked already :)"
	fi
}

download_appimage "bambu_studio" "https://github.com/bambulab/BambuStudio/releases/download/v01.08.04.51/BambuStudio_linux_ubuntu_v01.08.04.51_20240117.AppImage"
download_tar_xz "blender" "https://mirror.freedif.org/blender/release/Blender4.0/blender-4.0.1-linux-x64.tar.xz"
download_tar_xz "blender3.6" "https://mirror.freedif.org/blender/release/Blender3.6/blender-3.6.11-linux-x64.tar.xz"
