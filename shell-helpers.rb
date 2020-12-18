# frozen_string_literal: true

class ShellHelpers < Formula
  desc "Collection of POSIX-compatible functions that simplify writing shell code"
  homepage "https://github.com/logisparte/shell-helpers"
  url "https://packages.logisparte.com/shell-helpers/shell-helpers-0.6.0.tar.gz"
  sha256 "9aa350620b6c803c90c92bb5b5a6f853c818563c244c573441babde0f570e97e"
  license "GPL-3.0-only"

  def install
    libexec.install Dir["*"]
  end

  def caveats
    <<~EOS
      To complete the installation, add this variable in your PATH:

      export SHELL_HELPERS="#{libexec}"

    EOS
  end

  test do
    test_script = testpath/"test_script"
    test_script.write <<~EOS
      #!/bin/sh -e

      export SHELL_HELPERS="#{libexec}"
      . "$SHELL_HELPERS/report"
      report success "OK"

    EOS

    chmod "+x", test_script.to_s
    assert_match /OK/, shell_output(test_script.to_s)
  end
end
