# Mithril

Private messenger fork of [SimpleX Chat](https://github.com/simplex-chat/simplex-chat), operated by **Oak Digital**.

## Brand

**Product name:** Mithril  
**Operator:** Oak Digital  
**Servers:** exclusively `chat.oakendigital.com` (SMP, XFTP, and NTF presets)

Public SimpleX Chat (`*.simplex.im`) and Flux (`*.simplexonflux.com`) network presets are removed from this fork’s defaults. The client is configured to talk only to Oak Digital’s host.

> **Note:** The certificate fingerprint in server URIs is a placeholder until `chat.oakendigital.com` is provisioned and DNS resolves. Replace `hQWvjXQ3QyhCSu5LNyxW7AUiCM4EivfO-xWDt97PJ1U` with the real server fingerprint when the host is live.

## Why Mithril?

Tolkien-flavored name: mithril is rare, light, and strong — fitting for a private, hardened messenger. Avoided heavier film-trademark names (e.g. Palantir).

## Based on SimpleX Chat

This repository remains AGPLv3 and retains SimpleX protocol compatibility. Upstream project: https://github.com/simplex-chat/simplex-chat

Protocol documentation and contributing guides under `docs/` still describe the upstream SimpleX architecture; user-facing app strings and presets in this fork are rebranded to Mithril / Oak Digital.

## Install / build

See upstream docs for compiling the Haskell core and mobile/desktop apps:

- `docs/CONTRIBUTING.md`
- `docs/contributing/PROJECT.md`
- `apps/multiplatform/README.md`
- `apps/ios/README.md`

## License

AGPLv3 — see `LICENSE`.
