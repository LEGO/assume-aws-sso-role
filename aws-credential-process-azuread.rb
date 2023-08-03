class AwsCredentialProcessAzuread < Formula
  desc "An AWS credential process that uses AzureAD"
  homepage "https://github.com/LEGO/aws-credential-process-azuread"
  version "0.3.0"

  github_token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
  unless github_token
    odie "Environment variable HOMEBREW_GITHUB_API_TOKEN is required."
  end

  url "https://raw.githubusercontent.com/LEGO/aws-credential-process-azuread/v0.3.0/aws-credential-process-azuread",
    headers: [
      "Authorization: token #{github_token}"
    ]
  sha256 "4f15e7294308692eb20cc3ce4bb922fff01fd777d2c9107f22e18aaa980d4e6a"

  def install
    bin.install "aws-credential-process-azuread"
  end
end
