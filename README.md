## Installation

If you are on a mac, you can install the latest version of `aws-credential-process-azuread` using [Homebrew](https://brew.sh/), assuming you have SSH keys set up for accessing private LEGO repositories on GitHub:

```bash
export HOMEBREW_GITHUB_API_TOKEN=$(gh auth token)
brew tap LEGO/aws-credential-process-azuread git@github.com:LEGO/aws-credential-process-azuread.git
brew install aws-credential-process-azuread
```

If you don't have the `gh` GitHub CLI installed, you can [manually create a token](https://github.com/settings/tokens). Make sure you grant it the `read:packages` scope and SSO access to the LEGO Group GitHub organization.

## Prerequisites

For the OIDC2SAML token endpoint to be allowed to issue a SAML token you need to approve this on your AWS SSO application in Azure.

You can do this via the following methods if you are the owner of the application in Azure.

1. Azure portal
   App Registration → Your application → Expose an API → Add a client application
   Add the following GUID `3cd4d944-d89b-401b-b2ae-fb1ece182362` to the list, with the scope `user_impersonation`.

2. Powershell command [(LEGOIAM-AM Powershell module)](https://github.com/LEGO/IAM-CommonTools-OIDC2SAML-TokenExchange/tree/85e6ec42e8ff1d2d07d229a9878a830f52729ee2/Examples)
   Remember to check `main` for updates

## Example

Example AWS config

```ini
[profile example]
 credential_process=aws-credential-process-azuread "123456789012" "SSO-Example"
```
