class DevtoolsHub < Formula
  desc "Developer toolkit for system monitoring"
  homepage "https://github.com/jingjing737/devtools-hub"
  url "https://github.com/jingjing737/devtools-hub/archive/refs/tags/v3.5.0.tar.gz"
  sha256 "0820be837b0f0aa6350f32a9715756554a627d9bf40bb437d42a940cba450bd0"
  license "MIT"
  version "3.5.0"

  depends_on "python@3.11"

  def install
    python = Formula["python@3.11"].opt_bin/"python3.11"
    libexec.install "devtools_hub"
    libexec.install "devtools"
    venv = libexec/"venv"
    system python, "-m", "venv", venv
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
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "devtools_hub.cli", "--help"
  end
end
