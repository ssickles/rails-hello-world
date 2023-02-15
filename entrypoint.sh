#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

echo "Running migrations..."
rails db:migrate

echo "Running seeds..."
rails db:seed

exec "$@"
