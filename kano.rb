# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/2.4.1/kano.tar.gz"
  sha256 "75cd86354dc7cbc007a956ef15ecc14307b040ec7d80904affd4d10eb774f107"
  license "GPL-3.0-only"
  depends_on "docker" => :optional

  def install
    libexec.install Dir["kano/libexec/*"]
    doc.install Dir["kano/share/doc/*"]
    prefix.install "kano/LICENSE"
    bin.write_exec_script (libexec/"kano")
  end

  test do
    help_output = shell_output("kano help")
    assert_match(/Show this help message/, help_output)
  end
end
