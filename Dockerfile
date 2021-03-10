FROM ruby:3.0.0

RUN apt-get update -qq \
    && apt-get install -y build-essential postgresql-client git cmake nano neovim htop wget tar
WORKDIR /app

RUN gem install bundler --no-document
RUN bundle config git.allow_insecure true
COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle check || bundle install

ENTRYPOINT ["bundle", "exec"]
