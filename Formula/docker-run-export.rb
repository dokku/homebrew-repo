class DockerRunExport < Formula
  desc "Export docker run flags to various formats"
  homepage "https://github.com/dokku/docker-run-export"

  version "v0.5.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-run-export/releases/download/v#{version}/docker-run-export-darwin-amd64"
    sha256 "26673500135dbabffa438d462d51258a273ba796c110712390eb5a57c10f8f81"
  else
    url "https://github.com/dokku/docker-run-export/releases/download/v#{version}/docker-run-export-darwin-arm64"
    sha256 "716fd67c31c019a167c2316b5019c57b5d5718014859f96d95f55043a4765db0"
  end

  license "MIT"

  def install
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"

    bin.install "docker-run-export-darwin-#{arch}" => "docker-run-export"
    (prefix/"lib/docker/cli-plugins").install_symlink bin/"docker-run-export" => "docker-dre"
  end

  test do
    system bin/"docker-run-export", "version"
    assert_path_exists prefix/"lib/docker/cli-plugins/docker-dre"
  end
end
