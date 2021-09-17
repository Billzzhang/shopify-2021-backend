FROM ruby:2.7.4-alpine as base

ARG PACKAGES="build-dependencies build-base git nodejs yarn tzdata postgresql-client postgresql-dev"

RUN apk update && apk add --virtual $PACKAGES

RUN mkdir /shopify-2021-backend
WORKDIR /shopify-2021-backend
COPY Gemfile /shopify-2021-backend/Gemfile
COPY Gemfile.lock /shopify-2021-backend/Gemfile.lock
RUN bundle install
COPY . /shopify-2021-backend
RUN yarn install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
