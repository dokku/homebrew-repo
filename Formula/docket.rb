class Docket < Formula
  desc "Pre-package and ship applications on Dokku"
  homepage "https://github.com/dokku/docket"

  version "0.7.1"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docket/releases/download/#{version}/docket-darwin-amd64"
    sha256 "b9f4f6d1ba52f9097e61ea87c2d49adc6a71b17d17526ba7bc7c09934af912cf"
  else
    url "https://github.com/dokku/docket/releases/download/#{version}/docket-darwin-arm64"
    sha256 "4fb6fa55808444276c33ede4624569eecc56bfa680946291c1a03bd95257dd21"
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
