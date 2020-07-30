class ShellHelpers < Formula
  desc "Shell functions that simplify scripting"
  homepage "https://github.com/logisparte/shell-helpers"
  url "https://github.com/logisparte/shell-helpers/archive/0.3.1.tar.gz"
  sha256 "2e821c805ce2ccb5dabd95c90f3cb0188ade3a11357dfa875f5add9279e90507"
  license "MIT"

  def install
    bin.install "shell-helpers"
  end

  test do
    assert_match /OK/, shell_output(". shell-helpers && report success OK")
  end
end
