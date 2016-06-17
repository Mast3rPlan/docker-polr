FROM nginx:latest

RUN apt-get update
RUN apt-get install -y php5-cli php5-fpm php5-mysqlnd php5-mcrypt git
RUN rm /etc/nginx/conf.d/*

RUN git clone --depth 1  --branch 2.0.0b1 https://github.com/Cydrobolt/polr polr

# Default Configuration
ENV APP_KEY=DrLeswiahlu3hoUBl6cho2tlU5Pla6t7 APP_NAME=Polr APP_PROTOCOL=http:// APP_ADDRESS=example.com APP_STYLESHEET=
ENV DB_HOST=localhost DB_PORT=3306 DB_DATABASE=polr DB_USERNAME=root DB_PASSWORD=
ENV POLR_ALLOW_ACCT_CREATION=false POLR_ACCT_ACTIVATION=false POLR_GENERATED_AT= POLR_SETUP_RAN=true
ENV ST_PUBLIC_INTERFACE=true ST_SHORTEN_PERMISSION=true ST_INDEX_REDIRECT=/login ST_PASSWORD_RECOV=true ST_AUTO_API=true ST_ANON_API=false ST_BASE=32
ENV MAIL_HOST= MAIL_PORT= MAIL_USERNAME= MAIL_PASSWORD= MAIL_FROM_ADDRESS= MAIL_FROM_NAME=
ENV TMP_SETUP_AUTH_KEY=DrLeswiahlu3hoUBl6cho2tlU5Pla6t7

EXPOSE 80

RUN chmod -R 777 /polr
RUN chown -R www-data /polr

ADD conf/polr.conf /etc/nginx/conf.d/
ADD run.sh /
CMD bash /run.sh
