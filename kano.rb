# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://packages.logisparte.com/kano/kano-0.2.4.tar.gz"
  sha256 "db00cd52d6eca3206f150f7176168349dc6149dc4327c822a7b7f7c5fef28dac"
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
