class DockerPortForward < Formula
  desc "Forward local ports to running Docker containers or Compose services"
  homepage "https://github.com/dokku/docker-port-forward"

  version "0.3.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-port-forward/releases/download/#{version}/docker-port-forward-darwin-amd64"
    sha256 "1a1f524c2f3fec9c6d43ca4c0b0c1e791c1aa19097fee3aafa593e76292f80f6"
  else
    url "https://github.com/dokku/docker-port-forward/releases/download/#{version}/docker-port-forward-darwin-arm64"
    sha256 "01bfc74b806baa8adab6e33d5ea413b888d24b62a79f65714ee3bb522c98e8ad"
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
