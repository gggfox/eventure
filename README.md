# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
+ POSTGRESQL user privilege

$ psql -U postgres
postgres=# ALTER USER username CREATEDB;

* rails db:create
* rails db:migrate
* rails generate model User name:string email:string:index
* rails db:migrate
* rails db:schema:load
* rails server
* rails db:migrate:reset
+ rails test
+ rails g migration add_remember_digest_to_users remember_digest:string

* heroku logs
* heroku open
* heroku ps
* git push heroku master
* https://agile-spire-60503.herokuapp.com/
+ $ heroku run rails db:migrate
+ $ heroku pg:reset DATABASE
+ $ heroku run rails db:migrate
+ $ heroku run rails db:seed

* git add -p <filename>
* git commit -m ""
* git checkout -b <branch_name>
* git merge <branch_name>
* git branch -d <branch_name>
* git push -u origin master
