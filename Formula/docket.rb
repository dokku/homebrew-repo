class Docket < Formula
  desc "Pre-package and ship applications on Dokku"
  homepage "https://github.com/dokku/docket"

  version "0.10.2"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docket/releases/download/v#{version}/docket-darwin-amd64"
    sha256 "bde4ca33cf9dc47b8223f35740ab2dc52032457e3c59e4f819c526eea456e7b6"
  else
    url "https://github.com/dokku/docket/releases/download/v#{version}/docket-darwin-arm64"
    sha256 "ea977618fcc4a6653847d5e87aa5d36e8e9de67d5d9b26c3452dad74aa9d4275"
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
