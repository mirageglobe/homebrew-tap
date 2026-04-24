# homebrew-tap

homebrew tap for tools published by [mirageglobe](https://github.com/mirageglobe).

## requirements

- macOS (arm64 or x86_64) or Linux (x86_64)
- [homebrew](https://brew.sh) installed

## usage

```bash
# add this tap (one-time setup)
brew tap mirageglobe/tap

# install a formula
brew install mirageglobe/tap/scout

# upgrade all installed formulae
brew upgrade

# uninstall a formula
brew uninstall mirageglobe/tap/scout
```

you can also install directly without adding the tap first:

```bash
brew install mirageglobe/tap/scout
```

## available formulae

| formula | version | description                             | source                                          |
| ------- | ------- | --------------------------------------- | ----------------------------------------------- |
| scout   | 0.4.0   | terminal-native dual-pane file explorer | [github](https://github.com/mirageglobe/scout)  |

## adding a new formula

1. build and publish a github release with cross-compiled binaries and sha256 checksums.
2. add `Formula/<name>.rb` (use `Formula/scout.rb` as a reference).
3. set the correct `url` and `sha256` for each platform target (macOS arm64, macOS amd64, Linux amd64).
4. run `brew audit --new Formula/<name>.rb` locally before committing.
5. commit and push — the tap updates immediately.

## agent context

see [AGENT.md](AGENT.md) for ai assistant guidelines specific to this repository.
