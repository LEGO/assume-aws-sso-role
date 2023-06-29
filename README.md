## Installation

If you are on a mac, you can install the latest version of `amma-cli` using [Homebrew](https://brew.sh/), assuming you have SSH keys set up for accessing private LEGO repositories on GitHub:

```bash
export HOMEBREW_GITHUB_API_TOKEN=$(gh auth token)
brew tap LEGO/amma-cli git@github.com:LEGO/amma-cli.git
brew install amma-cli
```

If you don't have the `gh` GitHub CLI installed, you can [manually create a token](https://github.com/settings/tokens). Make sure you grant it the `read:packages` scope and SSO access to the LEGO Group GitHub organization.

## Example

Example AWS config

```ini
[profile example]
 credential_process=aws-credentials-process-azuread "123456789012" "SSO-Example"
```
