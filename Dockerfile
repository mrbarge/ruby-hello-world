FROM centos/ruby-25-centos7
USER default
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
COPY . /opt/app-root/src/
ENV GEM_HOME ~/.gem
RUN scl enable rh-ruby25 "bundle install"
CMD ["scl", "enable", "rh-ruby25", "./run.sh"]

USER root
RUN chmod og+rw /opt/app-root/src/db
RUN mkdir /hello
RUN useradd -u 1001 -g 1001 hello
RUN chown -R 1001:1001 /hello

USER default
