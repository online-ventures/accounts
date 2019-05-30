#!/bin/bash

bundle check || bundle install --binstubs="$BUNDLE_BIN"

if [ -z $1 ]; then
  if [ -f tmp/pids/server.pid ]; then
    echo "Stopping old server processes..."
    kill -SIGINT "$(cat tmp/pids/server.pid)" >/dev/null 2>&1
    rm tmp/pids/server.pid
  fi
  echo "Starting rails server in $RAILS_ENV environment"
  rails s -b 0.0.0.0 -p 3000
elif [[ $@ =~ ^(bundle|bundle install)$ ]]; then
  echo "Running bundle install"
  bundle install
elif [ $1 = "bundle" ]; then
  echo "Running bundle command: $@"
  "$@"
elif [ $1 = "rake" ]; then
  echo "Running rake command: $@"
  shift
  rake "$@"
elif [ $1 = "rails" ]; then
  echo "Running rails command: $@"
  shift
  rails "$@"
else
  echo "Running rails command: $@"
  rails "$@"
fi
