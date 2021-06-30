FROM php:7.4

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    openssh-client \
    rsync \
    apt-transport-https \
    build-essential \
    imagemagick \
    libmcrypt-dev \
    libmagickwand-dev \
    libpng-dev \ 
    libzip-dev \
    openssl \
    zip \ 
    unzip \
    git \
    gnupg \
    zlib1g-dev \
    libgtk2.0-0 \
    libgtk-3-0 \
    libgbm-dev \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    libxtst6 \
    xauth \
    xvfb


# Install composer and put binary into $PATH
RUN curl -sS https://getcomposer.org/installer | php -- --version=1.10.17 && \
    mv composer.phar /usr/local/bin/ && \
    ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs

RUN npm install -g gulp bower
RUN echo '{ "allow_root": true  }' > /root/.bowerrc