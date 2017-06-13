#!/bin/bash

CASTLE_PATH="$(dirname $0)/.."

cd "${CASTLE_PATH}/test-harness"

bundle install
bundle exec rspec
