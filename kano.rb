# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/2.3.0/kano.tar.gz"
  sha256 "6208bba85a301134056cea196e9eae960c91a6f0f36b8d15fb1f7e085f7a0309"
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
