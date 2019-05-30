#!/bin/bash

bundle check || bundle install --binstubs="$BUNDLE_BIN"

if [ -z $1 ]; then
  echo "Starting rails server in $RAILS_ENV environment"
  rails s -b 0.0.0.0 -p 3000
elif [[ $@ =~ ^(bundle|bundle install)$ ]]; then
  echo "Running bundle install"
  bundle install
elif [ $1 = "bundle" ]; then
  echo "Running bundle command: $@"
  "$@"
else
  echo "Running rails command: $@"
  rails "$@"
fi
