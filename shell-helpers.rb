class ShellHelpers < Formula
  desc "Shell functions that simplify scripting"
  homepage "https://github.com/logisparte/shell-helpers"
  url "https://github.com/logisparte/shell-helpers/archive/0.3.10.tar.gz"
  sha256 "518e3e9066ca8bb2bc6a513a2600c55ec25d2d734aca73e8b56193066e8fba4a"
  license "MIT"

  def install
    bin.install "shell-helpers"
  end

  test do
    assert_match /OK/, shell_output(". shell-helpers && report success OK")
  end
end
