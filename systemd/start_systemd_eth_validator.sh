#!/bin/sh

export CONFIG_FILES="\
config/kda_hyperlane.json,\
config/rpcs.json,\
/etc/hyperlane/rpcs.json,\
config/eth_validator.json,\
$CREDENTIALS_DIRECTORY/eth_secret.json"


if [[ -z "${VALIDATOR_NAME:-}" || "$VALIDATOR_NAME" == "my_validator" ]]; then
    echo "VALIDATOR_NAME invalid"
    exit 1
fi

mkdir -p .db/validator_eth

AWS_ACCESS_KEY_ID="$(jq -r '.id' < "$CREDENTIALS_DIRECTORY/aws_secret")" \
AWS_SECRET_ACCESS_KEY="$(jq -r '.key' < "$CREDENTIALS_DIRECTORY/aws_secret")" \
HYP_CHECKPOINTSYNCER_FOLDER="sigs-$VALIDATOR_NAME-eth" \
exec ./agents/validator
