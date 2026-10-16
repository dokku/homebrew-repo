class Docket < Formula
  desc "Pre-package and ship applications on Dokku"
  homepage "https://github.com/dokku/docket"

  version "0.9.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docket/releases/download/v#{version}/docket-darwin-amd64"
    sha256 "5b6086e505cca96c34a22862fe645feddbfad5a9b7e7a56b4eb9ce6b240ab98b"
  else
    url "https://github.com/dokku/docket/releases/download/v#{version}/docket-darwin-arm64"
    sha256 "0669d0418a58836dbb3ef7b806d22014d04c0f32efbe9d2ad647ef586b9e726c"
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
