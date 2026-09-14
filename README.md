# homebrew-ac-dc

Homebrew tap for the macOS-side key-export helpers of
[apple-cross-device-clipboard](https://github.com/cristim/apple-cross-device-clipboard)
(a.k.a. `ac-dc`) — receiving Apple Universal Clipboard / Handoff on Linux.

## Install

```sh
brew install cristim/ac-dc/ac-dc-keys
```

Provides:

- `ac-dc-export-keys` — export Continuity BLE keys from macOS into FileVault, arm auto-wipe
- `ac-dc-dump-to-keys` — convert a Frida `rapportd` dump to `keys.json`

Then pull `keys.json` to Linux with `scripts/import-keys-from-macos.sh` from the main repo.

Interop / research use with your own Apple ID and devices.
