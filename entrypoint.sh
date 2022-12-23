#!/bin/sh
git clone -b master https://github.com/WordPress/WordPress-Coding-Standards.git ~/wpcs

git clone https://github.com/Automattic/VIP-Coding-Standards ${HOME}/vipcs
git clone https://github.com/sirbrillig/phpcs-variable-analysis ${HOME}/variable-analysis
/usr/local/bin/phpcs --config-set installed_paths "${HOME}/wpcs,${HOME}/vipcs,${HOME}/variable-analysis"

if [ -z "${INPUT_STANDARD}" ]; then
    STANDARD="WordPress"
else
    STANDARD="WordPress,${INPUT_STANDARD}"
fi

if [ -z "${INPUT_EXCLUDES}" ]; then
    EXCLUDES="node_modules,vendor"
else
    EXCLUDES="node_modules,vendor,${INPUT_EXCLUDES}"
fi

phpcbf -i
phpcbf . -p --standard="${STANDARD}" --ignore="${EXCLUDES}" -v -vv --extensions=module/php
echo "PHPCBF Complete"


status=$?

exit $status
