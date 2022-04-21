class Dokku < Formula
  desc "Command-line client for the Dokku PaaS"
  homepage "https://dokku.com"
  url "https://github.com/dokku/dokku/archive/v0.27.1.tar.gz"
  sha256 "210ed262a8373e2c219763e1d7c28603c5adf034ec51908a206c2db707184725"

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
