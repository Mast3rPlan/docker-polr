echo "* Configuring polr"

cd polr
cp .env.setup .env
cat resources/views/env.blade.php > .env

sed -i "s^{{\\\$APP_KEY}}^$APP_KEY^g" .env
sed -i "s^{{\\\$APP_NAME}}^$APP_NAME^g" .env
sed -i "s^{{\\\$APP_PROTOCOL}}^$APP_PROTOCOL^g" .env
sed -i "s^{{\\\$APP_ADDRESS}}^$APP_ADDRESS^g" .env
sed -i "s^{{\\\$APP_STYLESHEET}}^$APP_STYLESHEET^g" .env

sed -i "s^{{\\\$DB_HOST}}^$DB_HOST^g" .env
sed -i "s^{{\\\$DB_PORT}}^$DB_PORT^g" .env
sed -i "s^{{\\\$DB_DATABASE}}^$DB_DATABASE^g" .env
sed -i "s^{{\\\$DB_USERNAME}}^$DB_USERNAME^g" .env
sed -i "s^{{\\\$DB_PASSWORD}}^$DB_PASSWORD^g" .env

sed -i "s^{{\\\$POLR_ALLOW_ACCT_CREATION}}^$POLR_ALLOW_ACCT_CREATION^g" .env
sed -i "s^{{\\\$POLR_ACCT_ACTIVATION}}^$POLR_ACCT_ACTIVATION^g" .env
sed -i "s^{{\\\$POLR_GENERATED_AT}}^$POLR_GENERATED_AT^g" .env
sed -i "s^{{\\\$POLR_SETUP_RAN}}^$POLR_SETUP_RAN^g" .env

sed -i "s^{{\\\$ST_PUBLIC_INTERFACE}}^$ST_PUBLIC_INTERFACE^g" .env
sed -i "s^{{\\\$ST_SHORTEN_PERMISSION}}^$ST_SHORTEN_PERMISSION^g" .env
sed -i "s^{{\\\$ST_INDEX_REDIRECT}}^$ST_INDEX_REDIRECT^g" .env
sed -i "s^{{\\\$ST_PASSWORD_RECOV}}^$ST_PASSWORD_RECOV^g" .env
sed -i "s^{{\\\$ST_AUTO_API}}^$ST_AUTO_API^g" .env
sed -i "s^{{\\\$ST_ANON_API}}^$ST_ANON_API^g" .env
sed -i "s^{{\\\$ST_BASE}}^$ST_BASE^g" .env

sed -i "s^{{\\\$MAIL_HOST}}^$MAIL_HOST^g" .env
sed -i "s^{{\\\$MAIL_PORT}}^$MAIL_PORT^g" .env
sed -i "s^{{\\\$MAIL_USERNAME}}^$MAIL_USERNAME^g" .env
sed -i "s^{{\\\$MAIL_PASSWORD}}^$MAIL_PASSWORD^g" .env
sed -i "s^{{\\\$MAIL_FROM_ADDRESS}}^$MAIL_FROM_ADDRESS^g" .env
sed -i "s^{{\\\$MAIL_FROM_NAME}}^$MAIL_FROM_NAME^g" .env

sed -i "s^{{\\\$TMP_SETUP_AUTH_KEY}}^$TMP_SETUP_AUTH_KEY^g" .env

echo "* Starting nginx"
service php5-fpm start && chmod a+rwx /var/run/php5-fpm.sock && nginx -g "daemon off;"
