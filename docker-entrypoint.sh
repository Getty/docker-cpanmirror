#!/bin/sh

set -e

if [[ $# -eq 0 ]]; then
    echo "Starting cpanmirrorhttpd for $PWD..."

    cpanmirrorhttpd
fi

if [[ "$1" = "mirror" ]]; then
    minicpan -l /cpan -r http://cpan.metacpan.org/
else
    exec "$@"
fi
