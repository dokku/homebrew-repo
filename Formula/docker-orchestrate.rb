class DockerOrchestrate < Formula
  desc "Docker plugin for orchestrating compose deploys"
  homepage "https://github.com/dokku/docker-orchestrate"

  version "0.3.1"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-amd64"
    sha256 "856bf2d2c5d4b86484809220df908b753241f1ae6405e2d02a90e610caac84b2"
  else
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-arm64"
    sha256 "1806080821805b5ec237ceb68f6a4f8dfb4e6e4de4226e300e1b2719e062f30c"
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
