# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://packages.logisparte.com/kano/kano-0.2.5.tar.gz"
  sha256 "0c699f5e11ba8b387fd2511f31cd37a5bbfdb1d98d457b47ce6532ab08ee04c5"
  license "GPL-3.0-only"
  depends_on "logisparte/packages/shell-helpers"

  def install
    libexec.install Dir["*"]
    bin.write_exec_script (libexec/"kano")
  end

  test do
    help_output = shell_output(
      "export SHELL_HELPERS=\"$(brew --prefix)/opt/shell-helpers/libexec\" && kano help",
    )

    assert_match /Show this help message/, help_output
  end
end
