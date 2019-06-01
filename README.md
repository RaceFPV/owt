# README

## Dev setup instructions (ubuntu/docker):

install yarn: https://yarnpkg.com/lang/en/docs/install/#debian-stable

install webpacker: rails webpacker:install

install other css/js things: yarn add bootstrap@4.3.1 jquery popper.js webpack

spin up a postgres database container: docker run --name owt-postgres -e POSTGRES_PASSWORD=owt -e POSTGRES_USER=owt -p 5432:5432 -d postgres

export the postgres password as an env variable:  export OWT_DATABASE_PASSWORD="owt" (also add it to bashrc)

migrate the database: rails db:migrate

start the server: rails server
