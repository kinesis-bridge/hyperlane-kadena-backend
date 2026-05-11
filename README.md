# kinesis-bridge-releases
Kinesis Bridge release scripts for backend

## System-d

## For a validator

Instuctions:

Make sure you have nodejs and jq installed:
```
apt install nodejs jq
```

1 - Untar the released file ideally in a special user home directory

2 - Choose a validator name

3 - Create 2 EVM-compatible keys/address:
- One for Eth
- One for KDA

Cast tool can be used:
```
./tools/cast wallet new
```

or

https://github.com/iancoleman/bip39



4 - Pepare the secrets

Fills the eth_validator_secret.json and kadena_validator_secret.json

```
mkdir -p /etc/hyperlane/
systemd-creds encrypt --name=aws_secret aws_secret.json /etc/hyperlane/aws_secret
systemd-creds encrypt --name=eth_secret.json eth_validator_secret.json /etc/hyperlane/eth_secret
systemd-creds encrypt --name=kadena_secret.json kadena_validator_secret.json /etc/hyperlane/kadena_secret
shred -u aws_secret.json eth_validator_secret.json kadena_validator_secret.json
```

5 - Copy the Unit files into /etc/systemd/system/
- kadena_hyperlane_eth_validator.service
- kadena_hyperlane_kadena_validator.service
- kadena_proxy.service

6 - Edit unit files to setup correclty the name of the validator

7 - Create /etc/hyperlane/rpcs.json

8 - Laucnh the services... starting with kadena_proxy


## For a Relayer

Instuctions:

Make sure you have nodejs and jq installed:
```
apt install nodejs jq
```

1 - Untar the released file ideally in a special user home directory


2 - Pepare the secrets

Fills the relayer_secret.json

```
mkdir -p /etc/hyperlane/
systemd-creds encrypt --name=aws_secret aws_secret.json /etc/hyperlane/aws_secret
systemd-creds encrypt --name=relayer_secret.json relayer_secret.json /etc/hyperlane/relayer_secret
shred -u aws_secret.json relayer_secret.json
```

3 - Copy the Unit files into /etc/systemd/system/
- kadena_hyperlane_relayer.service
- kadena_proxy.service

4 - Edit unit files to setup correclty the name of the validator

5 - Create /etc/hyperlane/rpcs.json

6 - Laucnh the services... starting with kadena_proxy