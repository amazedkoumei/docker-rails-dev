FROM centos:centos6

RUN yum -y update
RUN yum -y install gcc git rsync tar openssl openssl-devel readline-devel  zlib-devel libffi-devel gdbm-devel tk tk-devel tcl tcl-devel patch gcc-c++ which sqlite-devel wget openssh-server file
RUN yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
RUN yum -y install mysql mysql-devel ImageMagick
RUN yum -y install mysql mysql-devel ImageMagick
RUN yum -y install epel-release
RUN yum -y install nodejs npm --enablerepo=epel

# rbenvのインストール
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/shims:/root/.rbenv/bin:$PATH
RUN echo 'export PATH=/root/.rbenv/shims:/root/.rbenv/bin:$PATH' >> /root/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> /root/.bashrc

# rubyのインストール
ENV CONFIGURE_OPTS --disable-install-doc
RUN rbenv install 2.3.0
RUN rbenv global 2.3.0
RUN rbenv rehash
RUN rbenv exec gem install bundler

ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN bundle install
