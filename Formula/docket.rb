class Docket < Formula
  desc "Pre-package and ship applications on Dokku"
  homepage "https://github.com/dokku/docket"

  version "0.9.2"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docket/releases/download/v#{version}/docket-darwin-amd64"
    sha256 "38258a3d7b7c5c4b99ff519eeeed002614c3abfd751ef7a2d36b0cd1c995a4c1"
  else
    url "https://github.com/dokku/docket/releases/download/v#{version}/docket-darwin-arm64"
    sha256 "f4e04c52b3027ddbfe1b5a4855048f0d58547dfc617990d24d41266925a165bd"
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
