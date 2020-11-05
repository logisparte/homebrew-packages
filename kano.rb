# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://packages.logisparte.com/kano/kano-0.1.0.tar.gz"
  sha256 "c409ddbd9f4131c08c34ff9c03cefbd5008d40135b29e4e064d382c7b228ab33"
  license "GPL-3.0"
  depends_on "logisparte/packages/shell-helpers"

  def install
    lib.install Dir["*"]
    bin.install_symlink lib/"kano"
  end

  test do
    assert_match /helped/, shell_output(
      "export SHELL_HELPERS=\"$(brew --prefix)/opt/shell-helpers/lib\" && kano help"
    )
  end
end
