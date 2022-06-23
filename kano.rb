# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/3.6.0/kano.tar.gz"
  sha256 "636a98be7eba78d99b085fb573caa13cac841693deec52fd6315062f3bd49819"
  license "GPL-3.0-only"
  depends_on "git" => :optional
  caveats "Optional: brew install --cask docker"

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
