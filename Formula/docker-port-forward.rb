class DockerPortForward < Formula
  desc "Forward local ports to running Docker containers or Compose services"
  homepage "https://github.com/dokku/docker-port-forward"

  version "0.3.1"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-port-forward/releases/download/#{version}/docker-port-forward-darwin-amd64"
    sha256 "d64b0e540d51950ffdf3fd8e23f7ab6c0c6f5a2ff7d308743d4b0663185a891e"
  else
    url "https://github.com/dokku/docker-port-forward/releases/download/#{version}/docker-port-forward-darwin-arm64"
    sha256 "6a47589ecf014fc4faad672561122c6e314062fd54796f9c3e3d40d920e11d83"
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
