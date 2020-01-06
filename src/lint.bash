#!/usr/bin/env bash
# shellcheck disable=SC2034
lint::color:warn() {
    tput setaf 3 # yellow
    printf '%s\n' "${1}"
    tput sgr0
}
lint::color:error() {
    tput setaf 1 # red
    printf '%s\n' "${1}"
    tput sgr0
}
lint::color:notice() {
    tput setaf 6 # cyan
    printf '%s\n' "${1}"
    tput sgr0
}

lint::table() {
    local input="${1?}"
    #
    local ts="tslint"
    local js="js" #spidermonkey
    local json="jsonlint"
    local yaml="yamllint"; local yml="yamllint"
    #
    lint::color:notice "using ${!1} ..." >/dev/tty
    echo "${!1}"
}

lint() {
    local file
    file="$(basename "$1")"
    local ext
    ext="${file##*.}"
    local linter
    linter=$(lint::table "$ext")
    [[ "${#linter}" -eq 0 ]] && \
        lint::color:error "No linter known" && exit 77
    $linter "$*"
}

if [[ ${BASH_SOURCE[0]} != "$0" ]]; then
    export -f lint
else
    lint "${@}"
    exit $?
fi
