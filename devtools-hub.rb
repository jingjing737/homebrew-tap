class DevtoolsHub < Formula
  desc "Developer toolkit for system monitoring"
  homepage "https://github.com/jingjing737/devtools-hub"
  url "https://github.com/jingjing737/devtools-hub/archive/refs/tags/v3.5.0.tar.gz"
  sha256 "582117edaa08a7672b9df49e76c55e12f9f560cbd8dccead65d86fb8fd93f908"
  license "MIT"
  version "3.5.0"

  depends_on "python@3.14"

  def install
    python = Formula["python@3.14"].opt_bin/"python3.14"
    system python, "-m", "pip", "install", ".", "--prefix=#{prefix}"
  end

  test do
    system Formula["python@3.14"].opt_bin/"python3.14", "-m", "devtools_hub.cli", "--help"
  end
end
