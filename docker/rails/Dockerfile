FROM ruby:2.3.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm

# Node.js install
RUN npm install n -g
RUN n stable
RUN ln -sf /usr/local/bin/node /usr/bin/node

# Yarn install
RUN npm install -g yarn
RUN export PATH="$HOME/.yarn/bin:$PATH"

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
RUN bundle install
ADD Gemfile.lock /myapp
ADD . /myapp