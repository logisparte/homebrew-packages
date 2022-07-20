# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering workflow automation CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/4.2.3/kano.tar.gz"
  sha256 "7b546806957d806d23c7297044b3991955933407f007581b4f8a060b1869e3cc"
  license "GPL-3.0-only"
  depends_on "git" => :optional

  def install
    lib.install Dir["lib/*"]
    doc.install Dir["share/doc/*"]
    prefix.install "LICENSE"
    bin.write_exec_script (lib/"kano")
  end

  def caveats
    <<~EOF
      Homebrew formula does not support this syntax:
        depends_on cask: "docker" => :optional

      So to (optionally) install Docker Desktop, do:
        brew install --cask docker
    EOF
  end

  test do
    help_output = shell_output("kano help")
    assert_match(/Show this help message/, help_output)
  end
end
