docker-rails-dev
=======

thanks : [Dockerで開発環境を作る](http://qiita.com/miyasakura_/items/0e746d67a75d1e1b039d)

Requirement
---

- [Docker for Mac](https://docs.docker.com/docker-for-mac/)

if you don't have Docker for Mac, you need bellow

- [virtual box](http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html)
    - ~> 5.0.16
- [docker tool box](https://www.docker.com/products/docker-toolbox)
    - ~> 1.10.3

I suggest you to install Docker for Mac.  
Because you are released from `docker-machine` command by Docker for Mac.

Usage
---

### start

#### if you have Docker for Mac

```
$ docker-compose up
```

and access `http://localhost:3000`


#### if you don't have Docker for Mac

```
$ docker-machine start dev
$ eval "$(docker-machine env dev)"
$ docker-compose up
```
and access `http://192.168.99.100:3000`


### stop

#### if you have Docker for Mac

```
$ docker-compose stop
```

#### if you don't have Docker for Mac

```
$ docker-compose stop
$ docker-machine stop dev
```

### test

```
$ docker-compose run web bundle exec rake spec
```

### note

after editing `Gemfile`

```
$ docker-compose build
```

Install
----

### 1. create vm

if you have Docker for Mac, you don't need this step.

```
$ docker-machine create --virtualbox-disk-size "30000" -d virtualbox dev
$ eval "$(docker-machine env dev)"
```

### 2. clone your rails app

```
$ cd [repo-root]
$ git clone [your rail app repo] app
```

### 3. create docker base image

```
$ cd base-image
$ docker build -t my-dockerhub-repository/centos6-ruby2.3.0:latest .
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
<none>              <none>              bd9676237c92        3 minutes ago       887.3 MB
centos              centos6             cf2c3ece5e41        21 hours ago        194.6 MB
$ docker tag bd9676237c92  my-dockerhub-repository/centos6-ruby2.3.0:latest
```

### 4. init your rails app

```
$ cd ..
$ docker-compose run web bundle exec rake db:create db:migrate db:seed RAILS_ENV=development
$ docker-compose run web bundle exec rake db:create db:migrate RAILS_ENV=test
```

### 5. launch doker

```
$ docker-compose up
```
#### if you have Docker for Mac

and access `http://localhost:3000`

#### if you don't have Docker for Mac

and access `http://192.168.99.100:3000`

＼(^o^)／
