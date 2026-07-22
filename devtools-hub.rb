class DevtoolsHub < Formula
  desc "Developer toolkit for system monitoring"
  homepage "https://github.com/jingjing737/devtools-hub"
  url "https://github.com/jingjing737/devtools-hub/archive/refs/tags/v3.5.0.tar.gz"
  sha256 "6b3fa20f834c4661d9ea86e3a4f1e2154b9f3a606a10a0ea14983e4286b296e3"
  license "MIT"
  version "3.5.0"

  def install
    libexec.install "devtools_hub"
    libexec.install "devtools"
    venv = libexec/"venv"
    system "/usr/local/bin/python3.11", "-m", "venv", venv
    system venv/"bin/pip", "install", "flask", "psutil", "requests"
    (bin/"devtools").write <<~BASH
      #!/bin/bash
      exec "#{venv}/bin/python3" "#{libexec}/devtools_hub/cli.py" "$@"
    BASH
    chmod 0755, bin/"devtools"
  end

  test do
    system "/usr/local/bin/python3", "-m", "devtools_hub.cli", "--help"
  end
end
