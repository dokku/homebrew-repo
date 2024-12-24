class DockerContainerHealthchecker < Formula
  desc "Runs healthchecks against local docker containers"
  homepage "https://github.com/dokku/docker-container-healthchecker"

  version "v0.11.3"

  arch = Hardware::CPU.intel? ? "amd64" : "arm64"

  url "https://github.com/dokku/docker-container-healthchecker/releases/download/#{version}/docker-container-healthchecker-darwin-#{arch}"

  license "BSD-3-Clause"

  def install
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"

    bin.install "docker-container-healthchecker-darwin-#{arch}" => "docker-container-healthchecker"
  end

  test do
    system "#{bin}/docker-container-healthchecker" "version"
  end
end
