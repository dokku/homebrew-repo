class Dokku < Formula
  desc "Command-line client for the Dokku PaaS"
  homepage "https://dokku.com"
  url "https://github.com/dokku/dokku/archive/v0.26.8.tar.gz"
  sha256 "03bf6712b6f46a2d1b6fb8b93892634f7658c5585d11523985466d3454487d05"

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
