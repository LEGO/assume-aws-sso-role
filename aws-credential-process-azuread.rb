class AwsCredentialProcessAzuread < Formula
  desc "An AWS credential process that uses AzureAD"
  homepage "https://github.com/LEGO/aws-credential-process-azuread"
  version "0.1.0"

  github_token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
  unless github_token
    raise DownloadError, "Environment variable HOMEBREW_GITHUB_API_TOKEN is required."
  end

  url "https://raw.githubusercontent.com/LEGO/aws-credential-process-azuread/main/aws-credential-process-azuread",
    headers: [
      "Authorization: token #{github_token}"
    ]
  sha256 "90bac6a03c6dfd9e191c439ec90def673b1246b13e2b7c45467ac2b72ece1d31"

  def install
    bin.install "aws-credential-process-azuread"
  end
end
