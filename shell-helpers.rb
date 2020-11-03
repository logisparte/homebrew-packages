# frozen_string_literal: true

class ShellHelpers < Formula
  desc "Collection of POSIX-compatible functions that simplify writing shell code"
  homepage "https://github.com/logisparte/shell-helpers"
  url "https://packages.logisparte.com/shell-helpers/shell-helpers-0.5.2.tar.gz"
  sha256 "8dfbd9b0bbe7ef9988b5dae165dfa781cc3c635819cfc46dc8609cfe22114267"
  license "GPL-3.0"

  def install
    lib.install Dir["*"]
  end

  def caveats
    <<~EOS
      To complete the installation, add this variable in your PATH:

      export SHELL_HELPERS="#{lib}"

    EOS
  end

  test do
    test_script = testpath/"test_script"
    test_script.write <<~EOS
      #!/bin/sh -e

      export SHELL_HELPERS="#{lib}"
      . "$SHELL_HELPERS/report"
      report success "OK"

    EOS

    chmod "+x", test_script.to_s
    assert_match /OK/, shell_output(test_script.to_s)
  end
end
