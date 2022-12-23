#!/bin/sh
git clone -b master https://github.com/WordPress/WordPress-Coding-Standards.git ~/wpcs

if [ -z "${INPUT_EXCLUDES}" ]; then
    EXCLUDES="node_modules,vendor"
else
    EXCLUDES="node_modules,vendor,${INPUT_EXCLUDES}"
fi

php /usr/bin/php-cs-fixer list --raw --standard="${INPUT_STANDARD}"


status=$?

exit $status
