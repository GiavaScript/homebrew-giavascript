class Giavascript < Formula
  desc "JavaScript runtime implemented in Crystal"
  homepage "https://github.com/GiavaScript/GiavaScript"
  url "https://github.com/GiavaScript/GiavaScript/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "000068192d803f379ebe5e2aae9bfa38784c899c8376b7abd25f22a5f4ed00ad"
  license "MIT"

  depends_on "crystal"

  def install
    system "crystal", "build", "src/giavascript_cli.cr", "--release", "--no-debug", "-o", "giavascript"
    bin.install "giavascript"
    bin.install_symlink "giavascript" => "gs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/giavascript --version")
  end
end
