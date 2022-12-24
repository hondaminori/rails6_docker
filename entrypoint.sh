#!/bin/sh
set -e
rm -f /bookers21/tmp/pids/server.pid
exec "$@"
