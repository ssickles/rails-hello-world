#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

gem install bundler
echo "Verifying gems..."
bundle check || bundle install

exec "$@"
