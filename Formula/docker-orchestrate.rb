class DockerOrchestrate < Formula
  desc "Docker plugin for orchestrating compose deploys"
  homepage "https://github.com/dokku/docker-orchestrate"

  version "0.1.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-amd64"
    sha256 "2773048cdafdfefa75b05d7934ce7f6315de9dce5c90199ddd3b81d4004fa32c"
  else
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-arm64"
    sha256 "916af822ca9929a5a92e4cb0a0265e3108ce75309e9c9960237ba90ac84416dd"
  end

  license "MIT"

  def install
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"

    bin.install "docker-orchestrate-darwin-#{arch}" => "docker-orchestrate"
  end

  test do
    system "#{bin}/docker-orchestrate", "version"
  end
end
