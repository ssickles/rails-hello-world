FROM ruby:3.1.0

WORKDIR /root
COPY local.entrypoint.sh .
RUN chmod +x ./local.entrypoint.sh

ENV PORT 80
ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true
EXPOSE 80

ENTRYPOINT ["./local.entrypoint.sh"]
CMD ["bundle", "exec", "rails", "server"]
