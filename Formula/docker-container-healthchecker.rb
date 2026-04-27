class DockerContainerHealthchecker < Formula
  desc "Runs healthchecks against local docker containers"
  homepage "https://github.com/dokku/docker-container-healthchecker"

  version "v0.15.1"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-container-healthchecker/releases/download/v#{version}/docker-container-healthchecker-darwin-amd64"
    sha256 "de6fd3d51d2d13a50675d046e18b30d045b090c75d8bb2920be26bc4780167a5"
  else
    url "https://github.com/dokku/docker-container-healthchecker/releases/download/v#{version}/docker-container-healthchecker-darwin-arm64"
    sha256 "cd183abb7e55566fde74a18dc592bb42bd7b09173b38cdffc35b61f53f049e84"
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
