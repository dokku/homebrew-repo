class LambdaBuilder < Formula
  desc "Tool for building lambda function images or zips via Docker"
  homepage "https://github.com/dokku/lambda-builder"

  version "0.9.2"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/lambda-builder/releases/download/v#{version}/lambda-builder-darwin-amd64"
    sha256 "9cee4a0ec028d2b1bd10282b80c89fa9f515942313c3ca20bae56691be47fae4"
  else
    url "https://github.com/dokku/lambda-builder/releases/download/v#{version}/lambda-builder-darwin-arm64"
    sha256 "9177e2f4e52b32900d1e7b9dd8ab8dc085b10e58c5f399d2f56d47fd6a45d034"
  end

  license "MIT"

  def install
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"

    bin.install "lambda-builder-darwin-#{arch}" => "lambda-builder"
  end

  test do
    system bin/"lambda-builder", "version"
  end
end
