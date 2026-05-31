class Docket < Formula
  desc "Pre-package and ship applications on Dokku"
  homepage "https://github.com/dokku/docket"

  version "0.6.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docket/releases/download/#{version}/docket-darwin-amd64"
    sha256 "914b0fd654fe962f18b93a118a288599a5e727bad356e0c168036aae02b73787"
  else
    url "https://github.com/dokku/docket/releases/download/#{version}/docket-darwin-arm64"
    sha256 "9d05ed85169766eb8da7a3e9610ad8da32bd51ff1882973aa3001b3af4f48ac2"
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
