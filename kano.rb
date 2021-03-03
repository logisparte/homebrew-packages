# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/0.4.0/kano.tar.gz"
  sha256 "7759e63972fea45717d1aa4e8f507da1cfee5ade14378ae7f3d574f1ffe1f35c"
  license "GPL-3.0-only"

  def install
    libexec.install Dir["libexec/*"]
    doc.install Dir["share/doc/*"]
    prefix.install "LICENSE"
    bin.write_exec_script (libexec/"kano")
  end

  test do
    help_output = shell_output("kano help")
    assert_match(/Show this help message/, help_output)
  end
end
