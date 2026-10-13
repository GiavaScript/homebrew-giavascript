class Giavascript < Formula
  desc "JavaScript runtime implemented in Crystal"
  homepage "https://github.com/GiavaScript/GiavaScript"
  url "https://github.com/GiavaScript/GiavaScript/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "adc815f597272a5ff6fe5f4a69d5897ba76b32275bd8b918349f62256fbe6844"
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
