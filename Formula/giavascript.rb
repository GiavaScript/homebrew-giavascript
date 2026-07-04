class Giavascript < Formula
  desc "JavaScript runtime implemented in Crystal"
  homepage "https://github.com/GiavaScript/GiavaScript"
  url "https://github.com/GiavaScript/GiavaScript/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "ff17064db8744bada3e69461716def2f34d66dd802183e945616ed5163c652b6"
  license "MIT"

  depends_on "crystal"

  def install
    system "crystal", "build", "src/giavascript_cli.cr", "--release", "--no-debug", "-o", "bin/giavascript"
    bin.install "bin/giavascript"
    bin.install_symlink "giavascript" => "gs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/giavascript --version")
  end
end
