class HandoffClipKeys < Formula
  desc "Export Apple Continuity/Universal Clipboard keys from macOS for handoff-clip on Linux"
  homepage "https://github.com/cristim/apple-cross-device-clipboard"
  url "https://github.com/cristim/apple-cross-device-clipboard/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "be0910977354dd9012276983d88466a3ffb1dd8c552bd30c1d70656f5d964306"
  license "MIT"

  depends_on :macos
  depends_on "python@3.12"

  def install
    libexec.install "macos/export-keys.sh", "macos/dump-to-keys.py"
    bin.install_symlink libexec/"export-keys.sh" => "handoff-clip-export-keys"
    bin.install_symlink libexec/"dump-to-keys.py" => "handoff-clip-dump-to-keys"
  end

  def caveats
    <<~EOS
      macOS-side key export tools installed:
        handoff-clip-export-keys    export Continuity BLE keys into FileVault + arm auto-wipe
        handoff-clip-dump-to-keys   convert a Frida rapportd dump to keys.json

      Usage:
        handoff-clip-export-keys           # Path A (security CLI); prints Path B if blocked
      Path B (captures ALL device keys) needs SIP disabled once + `pip3 install frida-tools`.
      Then pull keys.json to Linux with scripts/import-keys-from-macos.sh from the repo.
    EOS
  end

  test do
    assert_match "dump", shell_output("#{bin}/handoff-clip-dump-to-keys --help")
  end
end
