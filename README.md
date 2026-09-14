# homebrew-apple-cross-device-clipboard-helper

Homebrew tap for the macOS-side key-export helpers of
[apple-cross-device-clipboard](https://github.com/cristim/apple-cross-device-clipboard)
(a.k.a. `handoff-clip`) — receiving Apple Universal Clipboard / Handoff on Linux.

## Install

```sh
brew install cristim/apple-cross-device-clipboard-helper/handoff-clip-keys
```

Provides:

- `handoff-clip-export-keys` — export Continuity BLE keys from macOS into FileVault, arm auto-wipe
- `handoff-clip-dump-to-keys` — convert a Frida `rapportd` dump to `keys.json`

Then pull `keys.json` to Linux with `scripts/import-keys-from-macos.sh` from the main repo.

Interop / research use with your own Apple ID and devices.
