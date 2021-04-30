# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/2.4.2/kano.tar.gz"
  sha256 "6c03f2c9a778a186b63a22e431f69754a0e4dcb60875f94da20a323c12f75e03"
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
