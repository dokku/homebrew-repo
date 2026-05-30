class Docket < Formula
  desc "Pre-package and ship applications on Dokku"
  homepage "https://github.com/dokku/docket"

  version "0.5.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docket/releases/download/#{version}/docket-darwin-amd64"
    sha256 "d4eb9ea5b500ae9213be40710b0f975892b670b5d142e675d7f74172937fecd7"
  else
    url "https://github.com/dokku/docket/releases/download/#{version}/docket-darwin-arm64"
    sha256 "98bf2fe60cfee79c61da829fc200a2f6edfa5addc4953d9c9f5744383abaffde"
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
