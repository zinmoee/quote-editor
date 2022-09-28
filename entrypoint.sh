#!/bin/bash
set -e

echo "* SQL MIGRATING"
bundle exec rake db:migrate

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
yarn build --watch
yarn build:css --watch