class Docket < Formula
  desc "Pre-package and ship applications on Dokku"
  homepage "https://github.com/dokku/docket"

  version "0.1.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docket/releases/download/#{version}/docket-darwin-amd64"
    sha256 "bd4cbe95f25de14e3fdbf9ac438069d64d75adb0e255ffd64d7e0dcd4bae8d94"
  else
    url "https://github.com/dokku/docket/releases/download/#{version}/docket-darwin-arm64"
    sha256 "38188c2ba5ec157a212324f697d6f5e8b631b5728bd5cef7ef85db4e20a6de5e"
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
