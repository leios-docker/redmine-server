#!/bin/sh

if [ ! -f /redmine/config/application.rb ]
then
  cp -Ra /redmine.default/* /redmine/
fi
cd /redmine && bundle install --without development test && rake generate_secret_token && ruby bin/rails server webrick -e production -b 0.0.0.0
