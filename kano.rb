# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/0.3.5/kano.tar.gz"
  sha256 "92d00d275494b78e2e66e533abab66e34feb4526a395de8c77d81b04bac200ba"
  license "GPL-3.0-only"

  def install
    libexec.install Dir["libexec/*"]
    doc.install Dir["share/doc/*"]
    prefix.install "LICENSE"
    bin.write_exec_script (libexec/"kano")
  end

  test do
    help_output = shell_output("kano help")
    assert_match (/Show this help message/), help_output
  end
end
