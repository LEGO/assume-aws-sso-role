class AssumeAwsSsoRole < Formula
  desc "A CLI tool for assuming AWS roles via SSO"
  homepage "https://github.com/LEGO/assume-aws-sso-role"
  version "0.4.0"

  url "https://raw.githubusercontent.com/LEGO/assume-aws-sso-role/v0.4.0/assume-aws-sso-role",
  sha256 "4f15e7294308692eb20cc3ce4bb922fff01fd777d2c9107f22e18aaa980d4e6a"

  def install
    bin.install "assume-aws-sso-role"
  end
end
