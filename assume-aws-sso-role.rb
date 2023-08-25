class AssumeAwsSsoRole < Formula
  desc "A CLI tool for assuming AWS roles via SSO"
  homepage "https://github.com/LEGO/assume-aws-sso-role"
  version "0.7.0"

  url "https://raw.githubusercontent.com/LEGO/assume-aws-sso-role/v0.7.0/assume-aws-sso-role"
  sha256 "22887f04a1c253d4a00c2280598b635b935e381dce15693c221df345a39a0171"

  def install
    bin.install "assume-aws-sso-role"
  end
end
