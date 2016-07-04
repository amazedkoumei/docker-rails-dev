FROM my-dockerhub-repository/centos6-ruby2.3.0

ENV APP_HOME /app

WORKDIR $APP_HOME
# ADD Gemfile* $APP_HOME/
ADD ./app $APP_HOME
RUN bundle install

EXPOSE 3000

#CMD ["bundle", "exec", "rails", "s", "-bind","0.0.0.0"]
CMD bash -l -c 'bundle exec rails s --bind=0.0.0.0'
