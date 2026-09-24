class DockerPortForward < Formula
  desc "Forward local ports to running Docker containers or Compose services"
  homepage "https://github.com/dokku/docker-port-forward"

  version "0.4.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-port-forward/releases/download/#{version}/docker-port-forward-darwin-amd64"
    sha256 "111c123c7b4a54a9336169833c15ff9d9a88709c0a9d0aef01c5303fe6e12552"
  else
    url "https://github.com/dokku/docker-port-forward/releases/download/#{version}/docker-port-forward-darwin-arm64"
    sha256 "56ceddf74b59fa56b87b13f0dd1d6e6e0af6a9c2a935f1a20832e19df9596fdb"
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
