#!/bin/sh

set -ex

mariadb-admin ping -h localhost -uroot -p${MARIADB_ROOT_PASSWORD} || exit 1