# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://packages.logisparte.com/kano/kano-0.2.2.tar.gz"
  sha256 "009e4400d578f233ec5091f027738e3cad1947985848a7be52e257b69b9c8228"
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
