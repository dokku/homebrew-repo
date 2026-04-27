class DockerContainerHealthchecker < Formula
  desc "Runs healthchecks against local docker containers"
  homepage "https://github.com/dokku/docker-container-healthchecker"

  version "v0.15.2"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-container-healthchecker/releases/download/v#{version}/docker-container-healthchecker-darwin-amd64"
    sha256 "06bfcf0c3bbdbeec378bc7c367b30664cc43f3bc2b795d71b2f074fe15abc7d1"
  else
    url "https://github.com/dokku/docker-container-healthchecker/releases/download/v#{version}/docker-container-healthchecker-darwin-arm64"
    sha256 "48094c767fd84bb4c1bc6ae9e4727de4bb1011b589fec87babc9188ff51670fc"
  end

  license "BSD-3-Clause"

  def install
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"

    bin.install "docker-container-healthchecker-darwin-#{arch}" => "docker-container-healthchecker"
    (prefix/"lib/docker/cli-plugins").install_symlink bin/"docker-container-healthchecker" => "docker-healthcheck"
  end

  test do
    system bin/"docker-container-healthchecker", "version"
    assert_path_exists prefix/"lib/docker/cli-plugins/docker-healthcheck"
  end
end
