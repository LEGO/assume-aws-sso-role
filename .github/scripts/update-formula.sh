#!/usr/bin/env bash
# https://github.com/LEGO/amma-cli/blob/46e3fd94e7bf57820376a08b2edb21abdd636ffb/.github/scripts/update-formula.sh
set -euxo pipefail
temp_dir="$(mktemp -d)"
trap "{ rm -rf ""$temp_dir""; }" EXIT

pushd "$temp_dir"
gh release download --repo LEGO/assume-aws-sso-role --pattern 'assume-aws-sso-role'
checksum="$(sha256sum assume-aws-sso-role | awk '{ print $1 }')"
popd

latest_version=$(gh release view --json name --jq '.name[1:]')
latest_release="$(gh api repos/LEGO/assume-aws-sso-role/releases/latest --jq '[.assets[] | select(.name | startswith("assume-aws-sso-role"))] | map({(.name): .url}) | add')"
url="$(jq --raw-output '."assume-aws-sso-role"' <<<"$latest_release")"

sed -i.old \
  -e "s|version \".*\"|version \"$latest_version\"|" \
  -e "s|url \".*\",|url \"$url\",|" \
  -e "s|sha256 \".*\"|sha256 \"$checksum\"|" \
  assume-aws-sso-role.rb
rm assume-aws-sso-role.rb.old
