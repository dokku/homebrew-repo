class DockerOrchestrate < Formula
  desc "Docker plugin for orchestrating compose deploys"
  homepage "https://github.com/dokku/docker-orchestrate"

  version "0.2.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-amd64"
    sha256 "7f0fafb403037dc1e706b5ce3b531cf112b0f99d2ed1733ac286b1ea0215cf62"
  else
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-arm64"
    sha256 "9fe0f7e1e67cff78b8bfa49bb59a6197d9ae4c3c1e861faa632ad17166cfd34f"
  end

  license "MIT"

  def install
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"

    bin.install "docker-orchestrate-darwin-#{arch}" => "docker-orchestrate"
    (prefix/"lib/docker/cli-plugins").install_symlink bin/"docker-orchestrate"
  end

  test do
    system "#{bin}/docker-orchestrate", "version"
    assert_predicate prefix/"lib/docker/cli-plugins/docker-orchestrate", :exist?
  end
end
