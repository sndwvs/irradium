#!/bin/bash

GIT_URL_CRUX="git://crux.nu/ports"
GIT_URL_IRRADIUM="https://gitlab.com/sndwvs"
DISTR_VERSIONS=("3.7")

#CRUX_UPDATE_GIT_REPO=${CRUX_UPDATE_GIT_REPO:-"yes"}
WORK_DIR=$(mktemp -d)
PORTS=(core opt xorg contrib)


trap 'cleaning' INT
trap 'cleaning' SIGINT
trap 'cleaning' TERM


message() {
    # parametr 1 - text message
    MESSAGE="$1"
    printf '|\e[1;33mwarn\x1B[0m| \e[0;32m%-12s\x1B[0m %s\n' "$ACTION" "$MESSAGE"
}

get_package_name() {
    local path="$1"
    package=$(grep -e "^name" $path | rev | cut -d "=" -f 1 | rev)
    echo $package
}

get_package_version() {
    local path="$1"
    version=$(grep -e "^version" $path | rev | cut -d "=" -f 1 | rev)
    echo $version
}

git_download() {
    local url="$1"
    local port="$2"
    echo "download port: $port"
    git clone -q ${url}/${port}.git ${WORK_DIR}/${port}
}

checkout_distr_version() {
    local version="$1"
    local port="$2"
    pushd $WORK_DIR/$port 2>&1>/dev/null
    if [[ $(git symbolic-ref --short HEAD) != ${version} ]]; then
        echo "port: $port  switch to version: $version"
        git checkout -qb $version remotes/origin/$version
    fi
    popd 2>&1>/dev/null
}

cleaning() {
    # clean work directory
    if [[ -d ${WORK_DIR} ]]; then
        rm -rf ${WORK_DIR}
    fi
    exit 0
}

check_repos() {
    local distr_version="$1"

    # get irradium repository
    git_download ${GIT_URL_IRRADIUM} "irradium"

    for port in ${PORTS[*]}; do
        # get crux repository
        git_download ${GIT_URL_CRUX} "${port}"
        checkout_distr_version "${distr_version}" "${port}"
        checkout_distr_version "${distr_version}" "irradium/irradium-${port}"

        # update crux repository
        #if [[ $CRUX_UPDATE_GIT_REPO = "yes" && -d $PATH_CRUX/$port ]]; then
        #    pushd $PATH_CRUX/$port 2>&1>/dev/null
        #    git pull -fq
        #    popd 2>&1>/dev/null
        #fi

        for irradium_pkgfile in ${WORK_DIR}/irradium/irradium-${port}/*/Pkgfile; do
            if [[ -e $irradium_pkgfile ]]; then
            irradium_package=$(get_package_name $irradium_pkgfile)
            irradium_version=$(get_package_version $irradium_pkgfile)
                if [[ -e $WORK_DIR/$port/$irradium_package/Pkgfile ]]; then
                    crux_pkg_path=$WORK_DIR/$port/$irradium_package/Pkgfile
                    crux_package=$(get_package_name $crux_pkg_path)
                    crux_version=$(get_package_version $crux_pkg_path)
                    if [[ $irradium_version != $crux_version ]]; then
                        printf "port: %-20s update package: %s   %-1s -> %+1s\n" irradium-${port} $irradium_package $irradium_version $crux_version
                    fi
                fi
            fi
        done
    done
}

for distr_version in ${DISTR_VERSIONS[*]}; do
    check_repos ${distr_version}
done

cleaning

