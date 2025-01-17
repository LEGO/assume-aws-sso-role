class AssumeAwsSsoRole < Formula
  desc "A CLI tool for assuming AWS roles via SSO"
  homepage "https://github.com/LEGO/assume-aws-sso-role"
  version "0.10.0"

  url "https://api.github.com/repos/LEGO/assume-aws-sso-role/releases/assets/221163074",
      headers: [
        "Accept: application/octet-stream",
      ]
  sha256 "1110b31f3de16d530a6be9df67a49e6aa554c0107a5d69f5d75650a0923b58f6"

  def install
    bin.install "assume-aws-sso-role"
  end
end
