class DockerOrchestrate < Formula
  desc "Docker plugin for orchestrating compose deploys"
  homepage "https://github.com/dokku/docker-orchestrate"

  version "0.2.2"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-amd64"
    sha256 "26f07f34a330fc76ae782786f804c978e4f6c36ac5b30363ff7a5c652aace78e"
  else
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-arm64"
    sha256 "663bfe42ca0206b5594694766d67639c57b88c0d06a81a2c96a0c0532b858b55"
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
