# Pull base image.
FROM leios76/redmine-volume

COPY files/init.sh /init.sh
COPY files/db_init.sh /db_init.sh

RUN \
    mkdir -p /redmine.default && \
    cp -R /redmine/config /redmine/files /redmine/plugins /redmine/repo /redmine/log /redmine.default && \
    cd /redmine && \
    gem install bundler && \
    bundle install --without development test && \
    rake generate_secret_token && \
    mkdir -p tmp tmp/pdf public/plugin_assets 

# Define default command.
CMD ["/init.sh"]

# Define working directory.
WORKDIR /redmine

# Expose ports.
EXPOSE 3000
