class DockerContainerHealthchecker < Formula
  desc "Runs healthchecks against local docker containers"
  homepage "https://github.com/dokku/docker-container-healthchecker"

  if Hardware::CPU.intel?
    url "https://github.com/dokku/docker-container-healthchecker/releases/download/v0.3.0/docker-container-healthchecker_0.3.0_darwin_amd64.tgz"
    sha256 "5f29863f86ceabbbea9b5bd762b606dfc29d9f0973a3dfe6484c7656503a83e2"
  else
    url "https://github.com/dokku/docker-container-healthchecker/releases/download/v0.3.0/docker-container-healthchecker_0.3.0_darwin_arm64.tgz"
    sha256 "789c514c567b956fa58809fea5fbf59bf38a5398e6eedc00d8952c3dfcdca070"
  end

  license "BSD-3-Clause"

  def install
    if Hardware::CPU.intel?
      bin.install "docker-container-healthchecker-amd64" => "docker-container-healthchecker"
    else
      bin.install "docker-container-healthchecker-arm64" => "docker-container-healthchecker"
    end
  end

  test do
    system "#{bin}/docker-container-healthchecker" "version"
  end
end
