# README
* when using postgresql must open the app and run it first (true?)
* when using postgresql i had to make sure to rake db:create and rake db:migrate before running rails server
* created rails project with the following:
* rails new . --api --database=postgresql -T --no-rdoc --no-ri
* -T flag means do not include testunit
* run server with command: rails s -p 3001
* rails scaffold was hanging after making the first model. fixed by running 'spring stop' in the command line


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
