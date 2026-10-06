class DockerOrchestrate < Formula
  desc "Docker plugin for orchestrating compose deploys"
  homepage "https://github.com/dokku/docker-orchestrate"

  version "0.4.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-amd64"
    sha256 "1ea321724df7739046d7b380ab4964e04071ad735d9e3bd6675856943a8b1a10"
  else
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-arm64"
    sha256 "d65a7670b68a750e2f167265ed34ec293a5e62b81f62c8188856659c49998da6"
  end

  license "MIT"

  def install
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"

    bin.install "docker-orchestrate-darwin-#{arch}" => "docker-orchestrate"
    (prefix/"lib/docker/cli-plugins").install_symlink bin/"docker-orchestrate"
  end

  test do
    system bin/"docker-orchestrate", "version"
    assert_path_exists prefix/"lib/docker/cli-plugins/docker-orchestrate"
  end
end
