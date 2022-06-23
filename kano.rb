# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering workflow automation CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/3.6.1/kano.tar.gz"
  version "3.6.1"
  sha256 "df95f7ad18fae6a716c429f6d0a48dae773f7335683a520d9b03ce2a8e2c5112"
  license "GPL-3.0-only"
  depends_on "git" => :optional

  def install
    libexec.install Dir["libexec/*"]
    doc.install Dir["share/doc/*"]
    prefix.install "LICENSE"
    bin.write_exec_script (libexec/"kano")
  end

  def caveats
    <<~EOS
      Homebrew formula does not support this syntax:
        depends_on cask: "docker" => :optional

      So, optionally do:
        brew install --cask docker

      To install Docker Desktop
    EOS
  end

  test do
    help_output = shell_output("kano help")
    assert_match(/Show this help message/, help_output)
  end
end
