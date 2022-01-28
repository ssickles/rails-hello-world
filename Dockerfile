FROM ruby:3.1.0

WORKDIR /root
COPY . .
RUN chmod +x ./entrypoint.sh

ENV PORT 80
ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true
RUN gem install bundler && bundle install
EXPOSE 80

ENTRYPOINT ["./entrypoint.sh"]
CMD ["bundle", "exec", "rails", "server"]
