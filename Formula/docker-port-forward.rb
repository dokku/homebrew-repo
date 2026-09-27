class DockerPortForward < Formula
  desc "Forward local ports to running Docker containers or Compose services"
  homepage "https://github.com/dokku/docker-port-forward"

  version "0.5.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-port-forward/releases/download/#{version}/docker-port-forward-darwin-amd64"
    sha256 "d306758935dd5a56c525ad0468d95074412865af8745aae202d605d3f715b92f"
  else
    url "https://github.com/dokku/docker-port-forward/releases/download/#{version}/docker-port-forward-darwin-arm64"
    sha256 "76ce23e161695035acc92da688ced40d97e19a881b8c400fd2031dbd2cc17ebf"
  end

  license "MIT"

  def install
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"

    bin.install "docker-port-forward-darwin-#{arch}" => "docker-port-forward"
    (prefix/"lib/docker/cli-plugins").install_symlink bin/"docker-port-forward" => "docker-pf"
  end

  test do
    system bin/"docker-port-forward", "--help"
    assert_path_exists prefix/"lib/docker/cli-plugins/docker-pf"
  end
end
