# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/0.3.1/kano.tar.gz"
  sha256 "9d2641f90cc3c11cdc8aa10db21116cf7a06f336f5bb3ccb29133417598221be"
  license "GPL-3.0-only"

  def install
    libexec.install Dir["libexec/*"]
    doc.install Dir["share/doc/*"]
    prefix.install "LICENSE"
    bin.write_exec_script (libexec/"kano")
  end

  test do
    help_output = shell_output("kano help")
    assert_match /Show this help message/, help_output
  end
end
