FROM jruby:9.3 as base

# Set the working directory in the container
WORKDIR /app

# Install netbase package
RUN apt-get update && apt-get install -y netbase

# Install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Set the environment variable to log Rails output to stdout
ENV RAILS_LOG_TO_STDOUT true

FROM base as rails

# Start the Puma server
CMD ["bundle", "exec", "puma"]
