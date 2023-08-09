# Prerequisites

To use the script the following steps must be completed:

1. Install AWS CLI. See instructions in the [AWS documentation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
2. Install Azure CLI. See instructions in the [Azure documentation](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).
3. Install `curl` if necessary.
4. Install `jq` if necessary.
5. Follow the steps in the [TokenExchange documentation](https://github.com/LEGO/IAM-CommonTools-OIDC2SAML-TokenExchange/tree/main/Examples).

# Installation

## Generic

Copy the script to a directory that is in your `$PATH`.

## Homebrew on MacOS

Perform the following steps:

```bash
brew tap LEGO/assume-aws-sso-role git@github.com:LEGO/assume-aws-sso-role.git
brew install assume-aws-sso-role
```

# Usage

This script supports two ways of assuming a role on AWS using the token exchange method.
Each of these are described below.

For each of the methods it is possible to select if the script should output the AWS
temporary credentials as JSON or by setting environment variables. In the latter case, the
script should be `source`d. It has been tested in Bash and Zsh. The default is to output
JSON.

Only one of the two methods can be supplied at one time. If both are attempted the script
will exit with an error message.

The script caches the temporary AWS credentials and automagically renews them if called
after expiration.

The JSON output is in a format suited for use in the `credential_process` setting in AWS
config profiles.

## Common options

`-h`: Print help text.

`-d`: The AWS session duration in seconds. The default is 3600 (1 hour).

`-e`: The region to use. If this is supplied then it overrides any region supplied in the
AWS config file (see below).

`-j`: Output temporary credentials in JSON format. This is the default action.

`-q`: Suppress all non-error output. If not supplied, status and progress messages are
written to `stderr`.

`-v`: Set environment variables

## Get credentials by supplying account number and role to assume

`-a`: Account number

`-r`: Role to assume

Example:
```shell
assume-aws-sso-role -a <account number> -r <role>
```


## Get credentials by reading role ARN and account number from an AWS config profile

In this mode the script looks for a profile with a given name in `$HOME/.aws/config`.

`-p <profile name>`: Profile to fetch information from

```shell
assume-aws-sso-role -p <profile name>
```

E.g., if there is a section in the config file with the structure
```
[profile my-profile]
region = eu-west-1
role_arn = arn:aws:iam::123456789012:role/SSO-My-Role
```

then we can assume the role by executing
```shell
assume-aws-sso-role -p my-profile
```

If a region is supplied in the profile _and_ a region is not supplied in the `-e` option
then it's used in the assume role step.


## Use as external process in AWS config profiles

Add a profile using the `credential_process` setting and use the options for supplying
account number, role, and region.

```ini
[profile example]
# Replace "/path/to" with the absolute path to the script on your disk.
 credential_process=/path/to/assume-aws-aws-role -q -a 123456789012 -r SSO-Example -e eu-west-1
```
