class DevtoolsHub < Formula
  desc "Developer toolkit for system monitoring"
  homepage "https://github.com/jingjing737/devtools-hub"
  url "https://github.com/jingjing737/devtools-hub/archive/refs/tags/v3.5.0.tar.gz"
  sha256 "aa756c66f0540af6610be799e0a24d66481a91d4a129e824349b21f79e68c9ca"
  license "MIT"
  version "3.5.0"

  depends_on "python@3.14"

  def install
    system "python3.14", "-m", "pip", "install", "./"
  end

  test do
    system "python3.14", "-m", "devtools_hub.cli", "--help"
  end
end
