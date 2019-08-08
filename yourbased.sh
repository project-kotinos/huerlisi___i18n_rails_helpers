#!/usr/bin/env bash
set -ex
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y tzdata
gem install bundler -v 2.0.1
# install
bundle install --binstubs --without tools
# before_script
gem update --system
bundle exec rake app:db:setup
# script
bundle exec rake
