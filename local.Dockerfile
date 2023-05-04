FROM nullstone/rails:webapp-ruby3

RUN apk add --no-cache --update \
    mysql-dev

WORKDIR /
COPY . .

# Set up entrypoint
RUN chmod +x local.entrypoint.sh
ENTRYPOINT ["/local.entrypoint.sh"]

CMD ["bundle", "exec", "rails", "server"]
