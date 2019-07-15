# !/usr/bin/bash

## Name: gen-repo-files
#
## Description: The script here generates a repo file for the user based on
#               the directory path where the packages live.  BASE_DIR needs
#               to be set as the parent directory for the repo containing
#               artifacts. DOCKER_EDITION is set based on which version of
#               Docker for which we wish to create a repo file. REPO_FILE_DIR
#               is the directory where we want the repo files to be stored
#
#  Usage w/ defaults: bash -c gen-repo-files
#  Usage w/o defaults: bash -c BASE_DIR=/srv REPO_FILE_DIR=/srv DOCKER_EDITION=ee gen_repo_files
##

BASE_DIR=${BASE_DIR:-/root/linux}
DOCKER_EDITION=${DOCKER_EDITION:-ce}

function ce_config {
  cat >> ${REPO_FILE} <<-EOF
  [docker-ce-${version}]
  name=Docker CE ${version} - $basearch
  baseurl=https://download.docker.com/linux/${DISTRO}/${dockerosversion:-\$dockerosversion}/${basearch:-\$basearch}/${version:-\$version}
  enabled=0
  gpgcheck=1
  gpgkey=https://download.docker.com/linux/${DISTRO}/gpg

  EOF
}

function ee_config {
  cat >> ${REPO_FILE} <<-EOF
  [docker-ee-${version}]
  name=Docker EE ${version} - ${basearch:-\$basearch}
  baseurl=\${dockerurl}/linux/${DISTRO}/${dockerosversion:-\$dockerosversion}/${basearch:-\$basearch}/${version:-\$version}
  enabled=0
  gpgcheck=1
  gpgkey=\${dockerurl}/linux/${DISTRO}/gpg

  EOF
}

function add_to_config {
  if [ "${DOCKER_EDITION}" == "ce" ]; then
    ce_config
  elif [ "${DOCKER_EDITION}" == "ee" ]; then
    ee_config
  else
    echo "[ERROR] Invalid Docker Edition provided or set: ${DOCKER_EDITION},
      set it to either 'ce' or 'ee'"
    exit 1
  fi
}

function gen_repo_file {
  REPO_FILE="${REPO_FILE_DIR}/docker-${DOCKER_EDITION}-${DISTRO}.repo"
  if [ -f "${REPO_FILE}" ]; then
    rm -f $REPO_FILE
  fi

  echo "[INFO] Creating new file at ${REPO_FILE}"
  touch $REPO_FILE
}

function gen_config {
  for channel in $(find ${BASE_DIR} -maxdepth 1 -mindepth 1 -type d); do
    DISTRO=`echo $channel|cut -d "/" -f4`
    REPO_FILE_DIR=${BASE_DIR}/${DISTRO}
    gen_repo_file

    for package_directory in $(find ${REPO_FILE_DIR} -maxdepth 3 -mindepth 3 -type d); do
      dockerosversion=`echo $package_directory|cut -d "/" -f5`
      basearch=`echo $package_directory|cut -d "/" -f6`
      version=`echo $package_directory|cut -d "/" -f7`

      add_to_config
    done
  done
}

gen_config
