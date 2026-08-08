class DockerOrchestrate < Formula
  desc "Docker plugin for orchestrating compose deploys"
  homepage "https://github.com/dokku/docker-orchestrate"

  version "0.3.2"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-amd64"
    sha256 "1bb4c2e02125ee9f278e700b0faddfdb2558d2b70a480cf3b0bbcd8d22a883a3"
  else
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-arm64"
    sha256 "7417eb66be74f69433d37a8ce3c17de4e2eacdfb6e611a9790e1eca7553f6eb3"
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
