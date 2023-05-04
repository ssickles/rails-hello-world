FROM nullstone/rails:webapp-ruby3

RUN apk add --no-cache --update \
    mysql-dev

WORKDIR /
COPY Gemfile* .
RUN bundle install

COPY . .

# Set up entrypoint
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

ENV PORT 80
EXPOSE 80

CMD ["bundle", "exec", "rails", "server"]
