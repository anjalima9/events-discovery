FROM ruby:3.2.2

# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# RUN apt-get update && apt-get install -y libvips
# RUN mkdir /events-discovery
WORKDIR /events-discovery
COPY Gemfile /events-discovery/Gemfile
COPY Gemfile.lock /events-discovery/Gemfile.lock

RUN bundle install
COPY . /events-discovery

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
