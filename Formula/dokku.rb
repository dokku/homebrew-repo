class Dokku < Formula
  desc "Command-line client for the Dokku PaaS"
  homepage "https://dokku.com"
  url "https://github.com/dokku/dokku/archive/v0.35.8.tar.gz"
  sha256 "ec97d6ec273add86743310b2aa33c9c530975a4240aab90e25a408d0cd69ec97"

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
