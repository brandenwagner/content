#!/bin/bash
#

{{% for path in FILEPATH %}}
{{% if IS_DIRECTORY and FILE_REGEX %}}
echo "Create specific tests for this rule because of regex"
{{% elif IS_DIRECTORY and RECURSIVE %}}
find -L {{{ path }}} -type d -exec chmod 777 {} \;
{{% else %}}
if [ ! -f {{{ path }}} ]; then
    touch {{{ path }}}
fi
chmod 777 {{{ path }}}
{{% endif %}}
{{% endfor %}}
