class AssumeAwsSsoRole < Formula
  desc "A CLI tool for assuming AWS roles via SSO"
  homepage "https://github.com/LEGO/assume-aws-sso-role"
  version "0.5.0"

  url "https://raw.githubusercontent.com/LEGO/assume-aws-sso-role/v0.5.0/assume-aws-sso-role"
  sha256 "82f7405552bda26ae16fa9dcfc448257d28acad39c0d345ebdb9d49770590da0"

  def install
    bin.install "assume-aws-sso-role"
  end
end
