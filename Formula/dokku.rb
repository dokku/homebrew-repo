class Dokku < Formula
  desc "Command-line client for the Dokku PaaS"
  homepage "http://dokku.viewdocs.io"
  url "https://github.com/dokku/dokku/archive/v0.22.7.tar.gz"
  sha256 "d3b00ecab8ebd9a91b780a8ad58666c3d3ae4f3fa59537a60f3ebf3aa5979bf1"

  def install
    bin.install "contrib/dokku_client.sh" => "dokku"
  end

  def caveats
    <<~EOS
      Run `dokku` from a repository with a git remote named `dokku` pointed
      at your Dokku host in order to use the script as normal, e.g.:

        git remote add dokku dokku@<dokku-host>:<app-name>

      or configure the `DOKKU_HOST`, `DOKKU_PORT` and `DOKKU_GIT_REMOTE`
      environment variables, e.g.:

        export DOKKU_HOST=dokku.me
        export DOKKU_PORT=22
        export DOKKU_GIT_REMOTE=dokku
    EOS
  end

  test do
    system bin/"dokku"
  end
end
