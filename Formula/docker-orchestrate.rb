class DockerOrchestrate < Formula
  desc "Docker plugin for orchestrating compose deploys"
  homepage "https://github.com/dokku/docker-orchestrate"

  version "0.3.0"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-amd64"
    sha256 "c3cc87bacfa97334a6a80ad6e4f08103ba01101281c0f4bf79b68001531cef4d"
  else
    url "https://github.com/dokku/docker-orchestrate/releases/download/#{version}/docker-orchestrate-darwin-arm64"
    sha256 "f46aa114f851988d939424acba24e68a04c6f509d71d1917ac26ba9e212d266c"
  end

  license "MIT"

  def install
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"

    bin.install "docker-orchestrate-darwin-#{arch}" => "docker-orchestrate"
    (prefix/"lib/docker/cli-plugins").install_symlink bin/"docker-orchestrate"
  end

  test do
    system bin/"docker-orchestrate", "version"
    assert_path_exists prefix/"lib/docker/cli-plugins/docker-orchestrate"
  end
end
