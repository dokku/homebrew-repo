class Docket < Formula
  desc "Pre-package and ship applications on Dokku"
  homepage "https://github.com/dokku/docket"

  version "0.10.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docket/releases/download/v#{version}/docket-darwin-amd64"
    sha256 "865123d1db2c258e55281a4ebe77819274c74f0607482bca26e7212a774f2bc2"
  else
    url "https://github.com/dokku/docket/releases/download/v#{version}/docket-darwin-arm64"
    sha256 "d54102c86ace1f0e1a2028d5aff7c18d63c951f044359b8ed204445d89c7a5e5"
  end

  license "MIT"

  def install
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"

    bin.install "docket-darwin-#{arch}" => "docket"
  end

  test do
    system bin/"docket", "version"
  end
end
