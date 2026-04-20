# homebrew-tap — agent context

this document is intended for AI coding assistants working in the `homebrew-tap` directory.

## repository purpose

this is a [homebrew tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap) for tools published by mirageglobe. each tool has a Ruby formula in `Formula/`.

## structure

```
homebrew-tap/
├── Formula/
│   └── <tool>.rb     # one formula per tool
├── .gitignore
├── AGENT.md
└── README.md
```

## formula conventions

- each formula targets macOS (arm64 + x86_64) and Linux (x86_64) as a minimum.
- use `on_macos` / `on_linux` blocks for platform-specific urls and sha256 values.
- sha256 values must match the release asset exactly — never guess or leave blank.
- keep the `desc` field short (under 80 chars), lowercase, no trailing period.
- test blocks should verify the binary runs and outputs a version string.

## updating a formula

when a new release is published:
1. update `url` to the new release asset tarball.
2. update `sha256` to match the new asset checksum.
3. update `version` if not inferred from the url.
4. run `brew audit --new Formula/<name>.rb` locally to catch issues before committing.

## commit messages

- keep titles concise and lowercase (e.g. `feat: add scout formula`, `fix: update scout to v0.2.0`).
- no co-author trailers.
