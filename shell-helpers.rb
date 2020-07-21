class ShellHelpers < Formula
  desc "A collection of self-contained shell functions that simplify scripting"
  homepage "https://github.com/logisparte/shell-helpers"
  license "MIT"
  url "https://github.com/logisparte/shell-helpers/archive/0.1.0.tar.gz"
  sha256 "11ff661b86e9bf2299d07ac97699210653bcd11c6ef92d5f3e65743ee0c3198b"

  def install
    bin.install "shell-helpers"
  end

  test do
    assert_match /OK/, shell_output(". shell-helpers && report success OK")
  end
end
