FROM ruby:2.7.0

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    postgresql-client \
    nodejs \
    yarn \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

WORKDIR /usr/src/app

COPY public/robots* public/
COPY app app
COPY vendor vendor
COPY bin bin
COPY config config
COPY db db
COPY lib lib
COPY Rakefile .
COPY config.ru .
COPY Gemfile .
COPY Gemfile.lock .
COPY anim8.conf .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT /usr/bin/entrypoint.sh
