# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://packages.logisparte.com/kano/kano-0.2.0.tar.gz"
  sha256 "ba907f258b4d987c21b488916dedf39a74d440a017546ea3f3a87ebbae3aa12a"
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