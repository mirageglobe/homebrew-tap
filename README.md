# homebrew-tap

homebrew tap for tools by [mirageglobe](https://github.com/mirageglobe).

## usage

```bash
# add the tap (one-time)
brew tap mirageglobe/tap

# install a tool
brew install scout

# upgrade all tools
brew upgrade
```

## available formulae

| formula | description                              |
| ------- | ---------------------------------------- |
| scout   | terminal-native dual-pane file explorer  |

## adding a new formula

1. build and publish a GitHub release with cross-compiled binaries and checksums.
2. add a new `Formula/<name>.rb` file (see `Formula/scout.rb` as a reference).
3. set the correct `url` and `sha256` values from the release assets.
4. commit and push — the tap is updated immediately.

## agent context

see [AGENT.md](AGENT.md) for AI assistant guidelines specific to this repository.
