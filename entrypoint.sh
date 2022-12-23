#!/bin/sh


/usr/local/bin/phpcs --config-set colors 1


git clone -b master https://github.com/WordPress/WordPress-Coding-Standards.git ~/wpcs

git clone https://github.com/Automattic/VIP-Coding-Standards ${HOME}/vipcs
git clone https://github.com/sirbrillig/phpcs-variable-analysis ${HOME}/variable-analysis
/usr/local/bin/phpcs --config-set installed_paths "${HOME}/wpcs,${HOME}/vipcs,${HOME}/variable-analysis"

if [ -z "${INPUT_STANDARD}" ]; then
    STANDARD="WordPress"
else
    STANDARD="${INPUT_STANDARD}"
fi

if [ -z "${INPUT_EXCLUDES}" ]; then
    EXCLUDES="node_modules,vendor"
else
    EXCLUDES="node_modules,vendor,${INPUT_EXCLUDES}"
fi

echo -e "\e[1;32mPHPCS Start\e[0m"

phpcs -i

phpcs . --colors --standard="${STANDARD}" --ignore="${EXCLUDES}" --extensions=php

echo -e "\e[1;32mSPHPCS Complete\e[0m"

echo -e "\e[1;32mSPHPCBF Start\e[0m"

phpcbf . -p -v --standard="${STANDARD}" --ignore="${EXCLUDES}" --extensions=php

echo -e "\e[1;32mSPHPCBF Complete\e[0m"


status=$?

exit $status
