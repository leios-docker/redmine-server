#!/bin/sh
cd /redmine && bundle install --without development test && rake generate_secret_token && ruby bin/rails server webrick -e production -b 0.0.0.0
