# kinesis-bridge-releases
Kinesis Bridge release scripts for backend

## System-d

## For a validator

Instuctions:

Make sure you have nodejs and jq installed:
```
apt install nodejs jq gpg
```
1 - Choose a validator name

2 - Create 2 EVM-compatible keys/address:
- One for Eth
- One for KDA

Cast tool can be used:
```
./tools/cast wallet new
```

or

https://github.com/iancoleman/bip39

3 - Install GPG Public Keys

```
gpg --no-default-keyring --keyring /etc/hyperlane/trustedkeys.kbx --import << EOF
-----BEGIN PGP PUBLIC KEY BLOCK-----

mQGNBGqj5NUBDADUIsp/aXHnTUUVHrGNxChKS746j/dmTN5iddAMk545jy7BiGOQ
gbL3vgpaAsU/ZUaD7O/vGZAW2eBoYIyGkAXz2w3DCTwWPneBlX9IrqYCxgQwtbRM
Z/vqGx7WjJPNd2VJKaPr1YrVsr4Gx4QRg62QlmTL2Aco0Py91mYreqRZwCPBra1L
s5MNG7xCvfNG6hvSHp9HLmDzS1MYWMIbVFdTiX8jk7HVfHllHQcnON/dIkzNYOqs
pAyAtX35YvWSHBQvLyQ8m4QBi+d0CCjExvbZUqJHSorIlhUIAfTHRECBDCLH1OPY
aY8u0zGEvyN2rZ1U31J/0oW+t3l3XdWO1QdmX3v2mxDnYm4RqlOyTgD1SnvdbFfT
/8ahdJ91C43cHyoxR4PeKgQhFyEHT+kw1Zyu+AstqN2ZqF94Hh0JocPmNsKh4ff9
q5YZfZYLjPSr4pzbrcii7YrP46DGbVqblIGECh9TjsKHMc86oq4PYrpi1e8FNLW/
JFS+M22pekRlcWcAEQEAAbQQS2luc2lzIEJyaWRnZSBDSYkBzgQTAQoAOBYhBGr3
HXofhc2ntIWjsc/RQxedIixxBQJqo+TVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4B
AheAAAoJEM/RQxedIixxw5YL/3nlpl0UMcbRHEIXrfdKwBkynqXyylEASWwluSS5
6r96dI0iTuUboKJHCrdo/w/kUSTXcGT17NUYoHJlvCgZLjnIJqHVHtd2CiohvQdN
hHB1KrAxhT5VDf1E4wjUbch2/tPE43b7yF17/hTCUGwemw036k4hP2srNiBx3ge0
3ypic2uFUWpNMNIQlfvJpLAdvsc3DjXMsTAk2GOv0XrBMCzYN9J9gkb7Pmd1gB9H
mgVUS3ysS+FiUjV8VvdifFGgiMUPbiPG0T7J29eGZu5WouiDA+N5EDdBMpXoK4iC
iuladIVwwKnbj7j7esPK8P+h2mvXSFuIAdu9t69QfTf0bfLgyftDhfSBfNOemdfs
eILkUbn9xOSQ+YLvyTeN34CpANII3Jn6iip8Wsfz5x4vBtqxv3GLWwMlQm5nL4VO
fzAuMxvVU0ykvPFysB1ufmH8K482ewfH6GaXtCPIiZQcOO91yHvUCVA4eVaX8xY6
WthEeaXSLH31ZIF7NqULH+57mw==
=ML1W
-----END PGP PUBLIC KEY BLOCK-----
-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEaQVgcRYJKwYBBAHaRw8BAQdAnP+ARwxAZm7eGocUhcnqm1qUJ15tlerm
HZGe5j2uzD7NKWtkYV9jb21tdW5pdHlAcG0ubWUgPGtkYV9jb21tdW5pdHlA
cG0ubWU+wsARBBMWCgCDBYJpBWBxAwsJBwkQskGwbEP+TTBFFAAAAAAAHAAg
c2FsdEBub3RhdGlvbnMub3BlbnBncGpzLm9yZynWhsHm/6wEmYBmGXzpU1I9
X9iQKz4kUsw72A4GJ/pdAxUKCAQWAAIBAhkBApsDAh4BFiEEZQoREsXC0He0
eUpuskGwbEP+TTAAALyJAQDsFbzDLA5xn4UuJVVDgX/cBF97x3hFz1ZAGIiX
cRyf4gEAs8Ck3eubr60pNbP7LX9eEEL2tCReNu0pbDWr9kTZnAnOOARpBWBx
EgorBgEEAZdVAQUBAQdAKkGBUmJJ+Ji2jaMf2Nu87vEjsl7W7ufHfH6XsVPr
ogsDAQgHwr4EGBYKAHAFgmkFYHEJELJBsGxD/k0wRRQAAAAAABwAIHNhbHRA
bm90YXRpb25zLm9wZW5wZ3Bqcy5vcmeT7PAYAfk7R+9v5uVskDsM3NsdjxLZ
a0M0avy8nmt1BAKbDBYhBGUKERLFwtB3tHlKbrJBsGxD/k0wAABuxwD+JIy7
iexBt/OjX85rylB9pC/Jr0dKVrb53BH8aorYxCIBAO+F5R/7SXC9at+xhYmQ
n1GlLUN818skrBci1iN/z9II
=YPDb
-----END PGP PUBLIC KEY BLOCK-----
EOF
```

with
```
gpg --list-keys --no-default-keyring --keyring /etc/hyperlane/trustedkeys.kbx
```

Check Keys ID: ``6AF71D7A1F85CDA7B485A3B1CFD143179D222C71`` and ``650A1112C5C2D077B4794A6EB241B06C43FE4D30``


4 - Pepare the secrets

Fill eth_validator_secret_template.json and kadena_validator_secret_template.json
Fill aws_secret_template_env

```
systemd-creds encrypt --name=aws_secret aws_secret_template_env /etc/hyperlane/aws_secret.env
systemd-creds encrypt --name=eth_secret.json eth_validator_secret_template.json /etc/hyperlane/eth_secret
systemd-creds encrypt --name=kadena_secret.json kadena_validator_secret_template.json /etc/hyperlane/kadena_secret
shred -u aws_secret_template_env eth_validator_secret_template.json kadena_validator_secret_template.json
```

5 - Copy the Unit files into /etc/systemd/system/
- kadena_hyperlane_eth_validator.service
- kadena_hyperlane_kadena_validator.service
- kadena_proxy.service

6 - Create /etc/hyperlane/validator.env
```
## Validator name
VALIDATOR_NAME=my_validator
```

7 - Create /etc/hyperlane/rpcs.json

8 - Launch the services... starting with kadena_proxy


## For a Relayer

Instuctions:

Make sure you have nodejs and jq installed:
```
apt install nodejs jq
```

1 - Install GPG Public Keys

2 - Prepare the secrets

Fill relayer_secret_template.json

```
mkdir -p /etc/hyperlane/
systemd-creds encrypt --name=aws_secret aws_secret_template_env /etc/hyperlane/aws_secret.env
systemd-creds encrypt --name=eth_secret.json relayer_secret_template /etc/hyperlane/eth_secret
shred -u aws_secret_template_env relayer_secret_template.json
```

3 - Copy the Unit files into /etc/systemd/system/
- kadena_hyperlane_relayer.service
- kadena_proxy.service

4 - Edit unit files to setup correclty the name of the validator

5 - Create /etc/hyperlane/rpcs.json

6 - Launch the services... starting with kadena_proxy