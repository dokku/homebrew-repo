class DockerPortForward < Formula
  desc "Forward local ports to running Docker containers or Compose services"
  homepage "https://github.com/dokku/docker-port-forward"

  version "0.2.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-port-forward/releases/download/#{version}/docker-port-forward-darwin-amd64"
    sha256 "c34d422cf76bdfd85dad2ffea4bd2497c259343a45acbe3acb43010c77768a3e"
  else
    url "https://github.com/dokku/docker-port-forward/releases/download/#{version}/docker-port-forward-darwin-arm64"
    sha256 "80bd1462786fc1673f87f0f251a4b6f0349fe9b520398608dffa4a28d3e74f4d"
  end

  license "MIT"

  def install
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"

    bin.install "docker-port-forward-darwin-#{arch}" => "docker-port-forward"
    (prefix/"lib/docker/cli-plugins").install_symlink bin/"docker-port-forward" => "docker-pf"
  end

  test do
    system "#{bin}/docker-port-forward", "--help"
    assert_predicate prefix/"lib/docker/cli-plugins/docker-pf", :exist?
  end
end
