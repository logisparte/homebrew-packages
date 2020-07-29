class ShellHelpers < Formula
  desc "A collection of self-contained shell functions that simplify scripting"
  homepage "https://github.com/logisparte/shell-helpers"
  license "MIT"
  url "https://github.com/logisparte/shell-helpers/archive/0.3.0.tar.gz"
  sha256 "fce7df7afbb5e017053b7f121a0f4d863eddc2d841a6f31fd5985eea1bb712c9"

  def install
    bin.install "shell-helpers"
  end

  test do
    assert_match /OK/, shell_output(". shell-helpers && report success OK")
  end
end
