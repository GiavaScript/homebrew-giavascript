class Giavascript < Formula
  desc "JavaScript runtime implemented in Crystal"
  homepage "https://github.com/GiavaScript/GiavaScript"
  url "https://github.com/GiavaScript/GiavaScript/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "8f8535bd17ad4b423ff91edaa06c4f5174bca52a040beaf2f9bf309d731ba356"
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
