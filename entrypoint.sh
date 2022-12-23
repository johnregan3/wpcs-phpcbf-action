#!/bin/sh
git clone -b master https://github.com/WordPress/WordPress-Coding-Standards.git ~/wpcs

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
