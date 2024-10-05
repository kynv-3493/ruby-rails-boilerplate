FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Ho_Chi_Minh
ENV RUBY_VERSION=3.2.2
ENV RUBYGEMS_VERSION=3.4.10

RUN apt-get update -qq && \
  apt-get install -y --no-install-recommends \
  # tzdata = config timezone
  tzdata \
  git-core \
  curl \
  # Lib dependency gem capybara-webkit
  qt5-default \
  libbison-dev \
  libqt5webkit5-dev \
  # Lib dependency gem pg
  postgresql \
  postgresql-contrib \
  libpq-dev \
  # Lib dependency gem mysql2
  libmysqlclient-dev \
  # Lib dependency for rvm
  software-properties-common && \
  # Install RVM https://github.com/rvm/ubuntu_rvm
  apt-add-repository -y ppa:rael-gc/rvm && \
  apt-get update -qq && \
  apt-get install -y --no-install-recommends rvm && \
  # Install nodejs 20 + yarn
  curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
  apt-get install -y --no-install-recommends nodejs && \
  npm install --global yarn && \
  # Clear apt cache
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Câu lệnh SHELL ["/bin/bash", "-l", "-c"] trong Dockerfile thiết lập Bash làm shell mặc định cho container,
# đảm bảo rằng mọi lệnh được thực thi sẽ sử dụng Bash trong chế độ đăng nhập, giúp tải các cấu hình môi trường đúng cách trước khi thực hiện các lệnh.
# Install Ruby and Bundler
SHELL ["/bin/bash", "-l", "-c"]
RUN echo 'source "/usr/share/rvm/scripts/rvm"' >> ~/.bashrc && \
  rvm requirements && \
  rvm install ${RUBY_VERSION} && \
  rvm use ${RUBY_VERSION} && \
  gem update --system ${RUBYGEMS_VERSION}

# Set path for Ryby
ENV PATH "/usr/share/rvm/rubies/ruby-${RUBY_VERSION}/bin:${PATH}"

# Create folder and copy project file
RUN mkdir /railsApp
WORKDIR /railsApp
ADD Gemfile /railsApp/Gemfile
ADD Gemfile.lock /railsApp/Gemfile.lock

RUN bundle install
