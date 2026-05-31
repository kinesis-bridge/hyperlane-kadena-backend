#!/bin/sh

export CONFIG_FILES="\
config/kda_hyperlane.json,\
config/rpcs.json,\
/etc/hyperlane/rpcs.json,\
config/relayer.json,\
$CREDENTIALS_DIRECTORY/relayer_secret.json"


mkdir -p ~/.db/relayer

AWS_ACCESS_KEY_ID="$(jq -r '.id' < "$CREDENTIALS_DIRECTORY/aws_secret")" \
AWS_SECRET_ACCESS_KEY="$(jq -r '.key' < "$CREDENTIALS_DIRECTORY/aws_secret")" \
exec ./agents/relayer
