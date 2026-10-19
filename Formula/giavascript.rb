class Giavascript < Formula
  desc "JavaScript runtime implemented in Crystal"
  homepage "https://github.com/GiavaScript/GiavaScript"
  url "https://github.com/GiavaScript/GiavaScript/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "b2105ee935d3b05bfbe0a785474a6a2f2c95c1e42064057cff008a3ff1959182"
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
