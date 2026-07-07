class Docket < Formula
  desc "Pre-package and ship applications on Dokku"
  homepage "https://github.com/dokku/docket"

  version "0.7.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docket/releases/download/#{version}/docket-darwin-amd64"
    sha256 "59970b24f276e9ab7ada2bddd7fd8a47bcefafcd94648400f59376efa58204b9"
  else
    url "https://github.com/dokku/docket/releases/download/#{version}/docket-darwin-arm64"
    sha256 "7736c927632cf7a2146c6312896a26e7fccf7caf4241e2c741226f4f662dd025"
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
