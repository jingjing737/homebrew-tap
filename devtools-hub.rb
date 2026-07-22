class DevtoolsHub < Formula
  desc "Developer toolkit for system monitoring"
  homepage "https://github.com/jingjing737/devtools-hub"
  url "https://github.com/jingjing737/devtools-hub/archive/refs/tags/v3.5.0.tar.gz"
  sha256 "582117edaa08a7672b9df49e76c55e12f9f560cbd8dccead65d86fb8fd93f908"
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
