FROM perl:5.36

COPY vendor /usr/src/cpanvendor

RUN cpanm --mirror "/usr/src/cpanvendor" --mirror-only --notest CPAN::Mini CPAN::Mirror::Server::HTTP

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN useradd -u 1000 -ms /bin/bash cpan

USER cpan

WORKDIR /cpan

ENTRYPOINT ["/bin/bash","/docker-entrypoint.sh"]

VOLUME ["/cpan"]

EXPOSE 8080
