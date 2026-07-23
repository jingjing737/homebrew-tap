class DevtoolsHub < Formula
  desc "Developer toolkit for system monitoring"
  homepage "https://github.com/jingjing737/devtools-hub"
  url "https://github.com/jingjing737/devtools-hub/archive/refs/tags/v3.5.0.tar.gz"
  sha256 "5d5ecfaf7c1bb7d1ee7dabd66cbd492b1da62736e36c0ae5eeda6d66d9312843"
  license "MIT"
  version "3.5.0"

  def install
    libexec.install "devtools_hub"
    libexec.install "devtools"
    venv = libexec/"venv"
    system "/usr/local/bin/python3.11", "-m", "venv", venv
    system venv/"bin/pip", "install", "flask", "psutil", "requests"

    # devtools 命令
    (bin/"devtools").write <<~BASH
      #!/bin/bash
      exec "#{venv}/bin/python3" "#{libexec}/devtools_hub/cli.py" "$@"
    BASH
    chmod 0755, bin/"devtools"

    # dev 短命令
    bin.install_symlink bin/"devtools" => "dev"
  end

  test do
    system "/usr/local/bin/python3.11", "-m", "devtools_hub.cli", "--help"
  end
end
