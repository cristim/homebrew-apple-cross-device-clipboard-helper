class AcDcKeys < Formula
  desc "Export Apple Continuity/Universal Clipboard keys from macOS for ac-dc on Linux"
  homepage "https://github.com/cristim/apple-cross-device-clipboard"
  url "https://github.com/cristim/apple-cross-device-clipboard/archive/refs/tags/v0.2.0.tar.gz"
  sha256 ""
  license "MIT"

  depends_on :macos
  depends_on "python@3.12"

  def install
    libexec.install "macos/export-keys.sh", "macos/dump-to-keys.py"
    bin.install_symlink libexec/"export-keys.sh" => "ac-dc-export-keys"
    bin.install_symlink libexec/"dump-to-keys.py" => "ac-dc-dump-to-keys"
  end

  def caveats
    <<~EOS
      macOS-side key export tools installed:
        ac-dc-export-keys    export Continuity BLE keys into FileVault + arm auto-wipe
        ac-dc-dump-to-keys   convert a Frida rapportd dump to keys.json

      Usage:
        ac-dc-export-keys           # Path A (security CLI); prints Path B if blocked
      Path B (captures ALL device keys) needs SIP disabled once + `pip3 install frida-tools`.
      Then pull keys.json to Linux with scripts/import-keys-from-macos.sh from the repo.
    EOS
  end

  test do
    assert_match "dump", shell_output("#{bin}/ac-dc-dump-to-keys --help")
  end
end
