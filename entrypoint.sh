#!/bin/sh
git clone -b master https://github.com/WordPress/WordPress-Coding-Standards.git ~/wpcs

git clone https://github.com/Automattic/VIP-Coding-Standards ${HOME}/vipcs
git clone https://github.com/sirbrillig/phpcs-variable-analysis ${HOME}/variable-analysis
${INPUT_PHPCS_BIN_PATH} --config-set installed_paths "${HOME}/wpcs,${HOME}/vipcs,${HOME}/variable-analysis"

if [ -z "${INPUT_EXCLUDES}" ]; then
    EXCLUDES="node_modules,vendor"
else
    EXCLUDES="node_modules,vendor,${INPUT_EXCLUDES}"
fi

phpcbf -i
# php /usr/bin/php-cs-fixer . --ignore="${EXCLUDES}" -vvv --extensions=module/php
echo "PHPCBF Complete"


status=$?

exit $status
