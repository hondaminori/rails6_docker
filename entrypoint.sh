#!/bin/sh
set -e
rm -f /rails6_docker/tmp/pids/server.pid
exec "$@"
