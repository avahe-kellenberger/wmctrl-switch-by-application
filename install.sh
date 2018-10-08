#!/usr/bin/env bash
set -e

temp_dir=$(mktemp -d)
cd "${temp_dir}"

curl -L "https://raw.githubusercontent.com/avahe-kellenberger/wmctrl-switch-by-application/master/wmctrl-switch-by-application.sh" -o "${PWD}/wmctrl-switch-by-application.sh"

install -Dm755 "${temp_dir}/wmctrl-switch-by-application.sh" "/usr/local/bin/wmctrl-switch-by-application"

cd "/"
trap 'rm -rf "${temp_dir}"' EXIT
echo "Done."