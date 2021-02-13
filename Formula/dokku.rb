class Dokku < Formula
  desc "Command-line client for the Dokku PaaS"
  homepage "http://dokku.viewdocs.io"
  url "https://github.com/dokku/dokku/archive/v0.23.4.tar.gz"
  sha256 "4f343772c624c3d622169052f609ebfec29bd45dfd893096e21135d26e60272e"

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
