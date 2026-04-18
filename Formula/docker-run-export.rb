class DockerRunExport < Formula
  desc "Export docker run flags to various formats"
  homepage "https://github.com/dokku/docker-run-export"
  license "MIT"

  version "v0.4.0"

  on_arm do
    url "https://github.com/dokku/docker-run-export/releases/download/#{version}/docker-run-export-darwin-arm64"
    sha256 "e00cbfd8dddf4ce97bc517d2d1cc9d8153f037ca3f52b7345d83749b9b2828b9"
  end

  on_intel do
    url "https://github.com/dokku/docker-run-export/releases/download/#{version}/docker-run-export-darwin-amd64"
    sha256 "f518def66e95c96083c6121c1dd876c9c3899917fac718ea7104c03eeabb26ae"
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"

    bin.install "docker-run-export-darwin-#{arch}" => "docker-run-export"
    (prefix/"lib/docker/cli-plugins").install_symlink bin/"docker-run-export" => "docker-dre"
  end

  test do
    system "#{bin}/docker-run-export", "version"
    assert_predicate prefix/"lib/docker/cli-plugins/docker-dre", :exist?
  end
end
