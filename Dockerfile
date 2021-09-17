FROM ruby:2.7.4
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client tzdata

RUN mkdir /shopify-2021-backend
WORKDIR /shopify-2021-backend
COPY Gemfile /shopify-2021-backend/Gemfile
COPY Gemfile.lock /shopify-2021-backend/Gemfile.lock
RUN bundle install
COPY . /shopify-2021-backend
RUN yarn install --check-files

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
