#!/bin/sh
set -ex

# This Entrypoint used when we run Docker container outside of Docker Compose (e.g. in k8s)

# In production we should replace some values in generated JS code
sed -i "s#DOCKER_API_BASE_URL#$API_BASE_URL#g" *.js
sed -i "s#DOCKER_CLIENT_BASE_URL#$CLIENT_BASE_URL#g" *.js
sed -i "s#DOCKER_API_HOST#$API_HOST#g" *.js
sed -i "s#DOCKER_API_PORT#$API_PORT#g" *.js
sed -i "s#DOCKER_WEB_HOST#$WEB_HOST#g" *.js
sed -i "s#DOCKER_WEB_PORT#$WEB_PORT#g" *.js
sed -i "s#DOCKER_HTTPS_SERVICES_ENDPOINT#$HTTPS_SERVICES_ENDPOINT#g" *.js
sed -i "s#DOCKER_SERVICES_ENDPOINT#$SERVICES_ENDPOINT#g" *.js
sed -i "s#DOCKER_GQL_ENDPOINT#$GQL_ENDPOINT#g" *.js
sed -i "s#DOCKER_GQL_SUBSCRIPTIONS_ENDPOINT#$GQL_SUBSCRIPTIONS_ENDPOINT#g" *.js
sed -i "s#DOCKER_SENTRY_DSN#$SENTRY_DSN#g" *.js
sed -i "s#DOCKER_CHATWOOT_SDK_TOKEN#$CHATWOOT_SDK_TOKEN#g" *.js
sed -i "s#DOCKER_CLOUDINARY_CLOUD_NAME#$CLOUDINARY_CLOUD_NAME#g" *.js
sed -i "s#DOCKER_CLOUDINARY_API_KEY#$CLOUDINARY_API_KEY#g" *.js
sed -i "s#DOCKER_GOOGLE_MAPS_API_KEY#$GOOGLE_MAPS_API_KEY#g" *.js
sed -i "s#DOCKER_GOOGLE_PLACE_AUTOCOMPLETE#$GOOGLE_PLACE_AUTOCOMPLETE#g" *.js
sed -i "s#DOCKER_DEFAULT_LATITUDE#$DEFAULT_LATITUDE#g" *.js
sed -i "s#DOCKER_DEFAULT_LONGITUDE#$DEFAULT_LONGITUDE#g" *.js
sed -i "s#DOCKER_DEFAULT_CURRENCY#$DEFAULT_CURRENCY#g" *.js
sed -i "s#DOCKER_DEFAULT_LANGUAGE#$DEFAULT_LANGUAGE#g" *.js
sed -i "s#DOCKER_CURRENCY_SYMBOL#$CURRENCY_SYMBOL#g" *.js
sed -i "s#DOCKER_NO_INTERNET_LOGO#$NO_INTERNET_LOGO#g" *.js
sed -i "s#DOCKER_MAP_MERCHANT_ICON_LINK#$MAP_MERCHANT_ICON_LINK#g" *.js
sed -i "s#DOCKER_MAP_USER_ICON_LINK#$MAP_USER_ICON_LINK#g" *.js
sed -i "s#DOCKER_MAP_CARRIER_ICON_LINK#$MAP_CARRIER_ICON_LINK#g" *.js
sed -i "s#DOCKER_API_FILE_UPLOAD_URL#$API_FILE_UPLOAD_URL#g" *.js
sed -i "s#DOCKER_COMPANY_NAME#$COMPANY_NAME#g" *.js
sed -i "s#DOCKER_COMPANY_SITE_LINK#$COMPANY_SITE_LINK#g" *.js
sed -i "s#DOCKER_COMPANY_GITHUB_LINK#$COMPANY_GITHUB_LINK#g" *.js
sed -i "s#DOCKER_COMPANY_FACEBOOK_LINK#$COMPANY_FACEBOOK_LINK#g" *.js
sed -i "s#DOCKER_COMPANY_TWITTER_LINK#$COMPANY_TWITTER_LINK#g" *.js
sed -i "s#DOCKER_COMPANY_LINKEDIN_LINK#$COMPANY_LINKEDIN_LINK#g" *.js
sed -i "s#DOCKER_GENERATE_PASSWORD_CHARSET#$GENERATE_PASSWORD_CHARSET#g" *.js
sed -i "s#DOCKER_SETTINGS_APP_TYPE#$SETTINGS_APP_TYPE#g" *.js
sed -i "s#DOCKER_SETTINGS_MAINTENANCE_API_URL#$SETTINGS_MAINTENANCE_API_URL#g" *.js
sed -i "s#DOCKER_DEMO#$DEMO#g" *.js

# We may not need to use that env vars now in nginx.config, but we may want later.
# Also we just need to copy nginx.conf to correct place anyway...
envsubst '' < /etc/nginx/conf.d/prod.conf.template > /etc/nginx/nginx.conf

exec "$@"
