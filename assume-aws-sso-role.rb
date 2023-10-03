class AssumeAwsSsoRole < Formula
  desc "A CLI tool for assuming AWS roles via SSO"
  homepage "https://github.com/LEGO/assume-aws-sso-role"
  version "0.9.0"

  url "https://api.github.com/repos/LEGO/assume-aws-sso-role/releases/assets/128808582",
      headers: [
        "Accept: application/octet-stream",
      ]
  sha256 "fc8247e31f6dd01a8949a231e876e7b0e16ee947e3515737755961fe24d016fd"

  def install
    bin.install "assume-aws-sso-role"
  end
end
