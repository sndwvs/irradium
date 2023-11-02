#!/bin/bash

PATH_IRRADIUM="/mnt/data/development/irradium"
PATH_CRUX="/home/dev/build/crux"
CRUX_UPDATE_GIT_REPO=${CRUX_UPDATE_GIT_REPO:-"yes"}
#WORK_DIR=$(mktemp -d)
PORTS=(core opt xorg contrib)




get_package_name() {
    local path=$1
    package=$(grep -e "^name" $path | rev | cut -d "=" -f 1 | rev)
    echo $package
}

get_package_version() {
    local path=$1
    version=$(grep -e "^version" $path | rev | cut -d "=" -f 1 | rev)
    echo $version
}

for port in ${PORTS[*]}; do
    # update crux repository
    if [[ $CRUX_UPDATE_GIT_REPO = "yes" && -d $PATH_CRUX/$port ]]; then
        pushd $PATH_CRUX/$port 2>&1>/dev/null
        git pull -fq
        popd 2>&1>/dev/null
    fi

    for irradium_pkgfile in ${PATH_IRRADIUM}/irradium-${port}/*/Pkgfile; do
        if [[ -e $irradium_pkgfile ]]; then
        irradium_package=$(get_package_name $irradium_pkgfile)
        irradium_version=$(get_package_version $irradium_pkgfile)
            if [[ -e $PATH_CRUX/$port/$irradium_package/Pkgfile ]]; then
                crux_pkg_path=$PATH_CRUX/$port/$irradium_package/Pkgfile
                crux_package=$(get_package_name $crux_pkg_path)
                crux_version=$(get_package_version $crux_pkg_path)
                if [[ $irradium_version != $crux_version ]]; then
                    printf "update package: %-50s  %-10s -> %+10s\n" $irradium_package $irradium_version $crux_version
                fi
            fi
        fi
    done
done
