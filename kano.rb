# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/3.4.0/kano.tar.gz"
  sha256 "60f558470adf3a0b0da4fc64433270bb7675e6ed61716a29c4e3ac69bac8964b"
  license "GPL-3.0-only"
  depends_on "docker" => :optional

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
