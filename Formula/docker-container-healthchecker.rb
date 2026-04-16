class DockerContainerHealthchecker < Formula
  desc "Runs healthchecks against local docker containers"
  homepage "https://github.com/dokku/docker-container-healthchecker"

  version "v0.11.3"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-container-healthchecker/releases/download/#{version}/docker-container-healthchecker-darwin-amd64"
    sha256 "583613f0ee58f9939c9171f6c0b2a2b17db4422742da97065dd4b184014043f7"
  else
    url "https://github.com/dokku/docker-container-healthchecker/releases/download/#{version}/docker-container-healthchecker-darwin-arm64"
    sha256 "4a42748d719cdc2d09452c852998f9d9e24bc590c29609dd7df5c20c6d8acb49"
  end

  license "BSD-3-Clause"

  def install
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"

    bin.install "docker-container-healthchecker-darwin-#{arch}" => "docker-container-healthchecker"
  end

  test do
    system "#{bin}/docker-container-healthchecker", "version"
  end
end
