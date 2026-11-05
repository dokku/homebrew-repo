class DockerPortForward < Formula
  desc "Forward local ports to running Docker containers or Compose services"
  homepage "https://github.com/dokku/docker-port-forward"

  version "0.7.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-port-forward/releases/download/v#{version}/docker-port-forward-darwin-amd64"
    sha256 "add88e6670ce74a19015b38b61347e98a78be587f6f48572b6a10eef66b3e58c"
  else
    url "https://github.com/dokku/docker-port-forward/releases/download/v#{version}/docker-port-forward-darwin-arm64"
    sha256 "95841871597d36c2816d49cfb50adf02aefb21a2183199633114e8d689c3db7f"
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
