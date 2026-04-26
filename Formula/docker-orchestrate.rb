class DockerOrchestrate < Formula
  desc "Docker plugin for orchestrating compose deploys"
  homepage "https://github.com/dokku/docker-orchestrate"

  version "0.2.1"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-amd64"
    sha256 "d0cbf1dd29d7b7f95c509e1e381caa07763bec74f285437a6d9c314e86291139"
  else
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-arm64"
    sha256 "fcc1ab6e87b7942517504d3ee2c9ac3bcfba060515fb773f89b1ea10af9dd9ab"
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
