# README


Installation
-----------------
#### Clone project
```
git clone git@github.com:rorlika/nss.git
cd nss
```
#### Install dependencies
```
bundle install
```
#### Run migrations
```
rake db:migrate
```
#### Run server
```
rails server
bundle exec rake jobs:work
```
## Requirements 
* rails version >= 5.1.2
* ruby version >=  2.3.3
* sqlite3
