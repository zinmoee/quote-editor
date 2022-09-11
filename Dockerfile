FROM ruby:3.0.3-slim

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
    curl \
    gnupg \
    build-essential \
    software-properties-common

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN apt-get install -y --no-install-recommends \
    bzip2 \
    git \
    shared-mime-info \
    ca-certificates \
    libffi-dev \
    libgdbm-dev \
    libssl-dev \
    libyaml-dev \
    patch \
    procps \
    ruby-dev \
    zlib1g-dev \
    liblzma-dev \
    default-mysql-client \
    default-libmysqlclient-dev \
    openssl \
    tzdata \
    imagemagick \
    iproute2 \
    nodejs \
    yarn \
    ffmpeg \
    supervisor \
		vim \
    libvips42 \
    && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND noninteractive
ENV app_path /usr/src/app
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

WORKDIR $app_path

RUN echo "install: --no-document" > $HOME/.gemrc && echo "update: --no-document" >> $HOME/.gemrc
COPY Gemfile* ./
RUN gem install bundler
RUN bundle config set --local deployment 'true'
RUN bundle config set --local without 'development test'
RUN bundle install --jobs 4

ADD . $app_path

RUN bundle exec rake assets:precompile

RUN ["chmod", "+x", "/usr/src/app/entrypoint.sh"]
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

CMD ["bundle", "exec", "rails", "s"]
