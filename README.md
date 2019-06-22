# README

## Dev setup instructions (ubuntu/docker):

install yarn: https://yarnpkg.com/lang/en/docs/install/#debian-stable

install webpacker: rails webpacker:install

install other css/js things: yarn add bootstrap@4.3.1 jquery popper.js webpack

create the database: rails db:setup

export the google drive service account json file as an env variable:  export SERVICE_ACCOUNT='{xxxxxxxx}'   (also add it to bashrc)

start the server: rails server
