FROM ruby:3.1.2-alpine3.16
RUN apk update \
      && apk add --no-cache gcc make libc-dev g++ mariadb-dev tzdata nodejs~=16 yarn
RUN apk add --no-cache imagemagick \
    && apk add --no-cache --virtual imagemagick-dev build-base autoconf \
    && apk add sudo git
WORKDIR /bookers21
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install --jobs=2
COPY . /bookers21
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
