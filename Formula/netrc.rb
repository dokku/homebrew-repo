class Netrc < Formula
  desc "Manage credentials in .netrc files"
  homepage "https://github.com/dokku/netrc"

  version "0.10.3"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/netrc/releases/download/v#{version}/netrc-darwin-amd64"
    sha256 "77bc106aba0da00033140515e5381603b001caa5dfb889d468198763eade6ac8"
  else
    url "https://github.com/dokku/netrc/releases/download/v#{version}/netrc-darwin-arm64"
    sha256 "00551130838bdb60e2ac26fc0b11102ee3a59f6f6956e1933912cc6421385c2a"
  end

  license "MIT"

  def install
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"

    bin.install "netrc-darwin-#{arch}" => "netrc"
  end

  test do
    system bin/"netrc", "version"
  end
end
