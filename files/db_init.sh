#!/bin/sh
cd /redmine
RAILS_ENV=production rake db:migrate
RAILS_ENV=production REDMINE_LANG=ko rake redmine:load_default_data

