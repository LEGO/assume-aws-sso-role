class AssumeAwsSsoRole < Formula
  desc "A CLI tool for assuming AWS roles via SSO"
  homepage "https://github.com/LEGO/assume-aws-sso-role"
  version "0.6.0"

  url "https://raw.githubusercontent.com/LEGO/assume-aws-sso-role/v0.6.0/assume-aws-sso-role"
  sha256 "02eb30ba66a4edad270a47228febc8b8b0b116d82d3834d7858876c10aeed8b4"

  def install
    bin.install "assume-aws-sso-role"
  end
end
