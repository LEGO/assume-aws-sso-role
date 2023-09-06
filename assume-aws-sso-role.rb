class AssumeAwsSsoRole < Formula
  desc "A CLI tool for assuming AWS roles via SSO"
  homepage "https://github.com/LEGO/assume-aws-sso-role"
  version "0.8.0"

  url "https://api.github.com/repos/LEGO/assume-aws-sso-role/releases/assets/124510094",
      headers: [
        "Accept: application/octet-stream",
      ]
  sha256 "3ca9c449a93acae4750926eb19f76350077023e4b2a5b54ae2379b742e76a2e3"

  def install
    bin.install "assume-aws-sso-role"
  end
end
