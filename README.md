# snowflake-schemachange

try https://github.com/Snowflake-Labs/schemachange

## Setup (if you run local pc)

python 3.7+

```bash
$ pip install -r requirements.txt
```

## First setup

create demo database and schema change table via manually

```sql
CREATE DATABASE SCHAMACHANGE_DEMO;

CREATE TABLE IF NOT EXISTS PUBLIC.CHANGE_HISTORY
(
    VERSION VARCHAR
   ,DESCRIPTION VARCHAR
   ,SCRIPT VARCHAR
   ,SCRIPT_TYPE VARCHAR
   ,CHECKSUM VARCHAR
   ,EXECUTION_TIME NUMBER
   ,STATUS VARCHAR
   ,INSTALLED_BY VARCHAR
   ,INSTALLED_ON TIMESTAMP_LTZ
);
```

## Auth

```bash
$ openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out rsa_key.p8
# remember passphrase to set github secret
$ openssl rsa -in rsa_key.p8 -pubout -out rsa_key.pub
$ cat rsa_key.pub | pbcopy
```

```sql
CREATE USER "SCHEMA_CHANGE_CI" RSA_PUBLIC_KEY='PUBKEY';
GRANT ROLE SYSADMIN TO USER SCHEMA_CHANGE_CI; # caution!!
```
