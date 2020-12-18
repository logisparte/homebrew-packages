# frozen_string_literal: true

class ShellHelpers < Formula
  desc "Collection of POSIX-compatible functions that simplify writing shell code"
  homepage "https://github.com/logisparte/shell-helpers"
  url "https://packages.logisparte.com/shell-helpers/shell-helpers-0.7.0.tar.gz"
  sha256 "739ea38a7d32d7ff2abac57c9be0bead95f3b69c2c77dfc4193f9de35ecd20f3"
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
