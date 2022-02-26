FROM ommadawn46/mal1c10us-ng1nx:latest
LABEL maintainer="ommadawn46"

WORKDIR /var/www/app/sns/

RUN /bin/echo -e "Acquire::http::Timeout \"300\";\n\
Acquire::ftp::Timeout \"300\";" >> /etc/apt/apt.conf.d/99timeout
RUN gpg --keyserver pgp.mit.edu --recv-keys 9554F04D7259F04124DE6B476D5A82AC7E37093B ;
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 9554F04D7259F04124DE6B476D5A82AC7E37093B ;
RUN sed -i.org -e 's|archive.ubuntu.com|jp.archive.ubuntu.com|g' /etc/apt/sources.list ;
RUN apt -o Acquire::ForceIPv4=true update

RUN apt-get update && apt-get -y install \
    apt-utils \
    imagemagick \
    libmagickwand-dev \
    php-fpm \
    python-software-properties \
    software-properties-common \
    sqlite3 \
    vsftpd \
 && apt-get -y purge libgs9 libgs9-common ghostscript && apt-get -y install \
    libgs9=9.18~dfsg~0-0ubuntu2 \
    libgs9-common=9.18~dfsg~0-0ubuntu2 \
    ghostscript=9.18~dfsg~0-0ubuntu2 \
 && apt-add-repository -y ppa:brightbox/ruby-ng && apt-get update && apt-get -y install \
    rbenv \
    ruby-build \
    ruby-dev \
    ruby2.4 \
    ruby2.4-dev \
 && curl -s -L https://github.com/mailhog/MailHog/releases/download/v1.0.0/MailHog_linux_amd64 -o /root/MailHog_linux_amd64

COPY files/sns /var/www/app/sns
RUN gem install bundler && bundle install

COPY files/conf/nginx-default /etc/nginx/sites-enabled/default
COPY files/conf/nginx.conf /etc/nginx/nginx.conf
COPY files/conf/vsftpd.conf /etc/vsftpd.conf
COPY files/conf/policy.xml /etc/ImageMagick-6/policy.xml
COPY files/bad_sns_production.sql /root/bad_sns_production.sql
COPY files/rc.local /etc/rc.local

RUN chmod -R 775 /var/www/app/ \
 && chmod 755 /root/MailHog_linux_amd64 \
 && chmod 755 /etc/rc.local \
 && systemctl enable vsftpd

EXPOSE 80
CMD ["/sbin/init"]
