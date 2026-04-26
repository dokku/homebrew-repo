class DockerContainerHealthchecker < Formula
  desc "Runs healthchecks against local docker containers"
  homepage "https://github.com/dokku/docker-container-healthchecker"

  version "0.15.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-container-healthchecker/releases/download/v#{version}/docker-container-healthchecker-darwin-amd64"
    sha256 "dbb04b868e48deef6fa5562d4e094a7f28f045d132cc0187bf1151f13fa097c7"
  else
    url "https://github.com/dokku/docker-container-healthchecker/releases/download/v#{version}/docker-container-healthchecker-darwin-arm64"
    sha256 "2aad857fda7f2ad2452fd77d653f539f722bcc66f1cfe73253dc1ffe6a1fa49b"
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
