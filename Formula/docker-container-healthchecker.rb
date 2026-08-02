class DockerContainerHealthchecker < Formula
  desc "Runs healthchecks against local docker containers"
  homepage "https://github.com/dokku/docker-container-healthchecker"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-container-healthchecker/releases/download/v0.16.0/docker-container-healthchecker-darwin-amd64"
    sha256 "5c5dc0bedb18e77b79b8b3c8cdfce04baa06105b6155e5f6890ecadb983ba965"
  else
    url "https://github.com/dokku/docker-container-healthchecker/releases/download/v0.16.0/docker-container-healthchecker-darwin-arm64"
    sha256 "df30f020fae104309628e2ecea62d42a73c57d81bce2cfadcf7d5dd1869d34d5"
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
