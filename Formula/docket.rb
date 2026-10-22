class Docket < Formula
  desc "Pre-package and ship applications on Dokku"
  homepage "https://github.com/dokku/docket"

  version "0.10.1"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docket/releases/download/v#{version}/docket-darwin-amd64"
    sha256 "9e98edb618742de185fd714572c8d215f301fceae88aec8cdb4d781889b47de4"
  else
    url "https://github.com/dokku/docket/releases/download/v#{version}/docket-darwin-arm64"
    sha256 "581d9b9fb453b174e92e640f465061efd914a1eea0f06b4b34217c3877c52217"
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
