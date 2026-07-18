.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:

FORMULA ?=
VERSION ?=
REPO    ?= $(FORMULA)

# ─────────────────────────────────────────────────────────────
.PHONY: help update

help:			## show this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nusage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

##@ tap

update:			## update formula: make update FORMULA=scout VERSION=0.7.0 [REPO=scout]
	@if [ -z "$(FORMULA)" ] || [ -z "$(VERSION)" ]; then
		echo "usage: make update FORMULA=<name> VERSION=<x.y.z> [REPO=<github-repo-name>]"; exit 1
	fi
	CHECKSUMS_URL="https://github.com/mirageglobe/$(REPO)/releases/download/v$(VERSION)/$(FORMULA)_$(VERSION)_checksums.txt"
	echo "fetching $$CHECKSUMS_URL"
	CHECKSUMS=$$(curl -fsSL "$$CHECKSUMS_URL")
	SHA_DARWIN_AMD64=$$(echo "$$CHECKSUMS" | awk '/darwin_amd64\.tar\.gz/ {print $$1}')
	SHA_DARWIN_ARM64=$$(echo "$$CHECKSUMS" | awk '/darwin_arm64\.tar\.gz/ {print $$1}')
	SHA_LINUX_AMD64=$$(echo "$$CHECKSUMS"  | awk '/linux_amd64\.tar\.gz/  {print $$1}')
	# guard: abort if any expected checksum is missing, otherwise the sed below
	# would patch sha256 "" and we would push a broken formula
	for pair in "darwin_amd64:$$SHA_DARWIN_AMD64" "darwin_arm64:$$SHA_DARWIN_ARM64" "linux_amd64:$$SHA_LINUX_AMD64"; do
		if [ -z "$${pair#*:}" ]; then echo "missing checksum for $${pair%%:*} in release assets; aborting"; exit 1; fi
	done
	FORMULA_FILE="Formula/$(FORMULA).rb"
	if [ ! -f "$$FORMULA_FILE" ]; then echo "formula not found: $$FORMULA_FILE"; exit 1; fi
	sed -i '' \
		-e 's|version ".*"|version "$(VERSION)"|g' \
		-e 's|mirageglobe/[^/]*/releases/download/v[0-9]*\.[0-9]*\.[0-9]*/|mirageglobe/$(REPO)/releases/download/v$(VERSION)/|g' \
		-e "s|$(FORMULA)_[0-9]*\.[0-9]*\.[0-9]*_darwin_amd64|$(FORMULA)_$(VERSION)_darwin_amd64|g" \
		-e "s|$(FORMULA)_[0-9]*\.[0-9]*\.[0-9]*_darwin_arm64|$(FORMULA)_$(VERSION)_darwin_arm64|g" \
		-e "s|$(FORMULA)_[0-9]*\.[0-9]*\.[0-9]*_linux_amd64|$(FORMULA)_$(VERSION)_linux_amd64|g" \
		-e "/darwin_amd64\.tar\.gz/{n; s|sha256 \".*\"|sha256 \"$$SHA_DARWIN_AMD64\"|;}" \
		-e "/darwin_arm64\.tar\.gz/{n; s|sha256 \".*\"|sha256 \"$$SHA_DARWIN_ARM64\"|;}" \
		-e "/linux_amd64\.tar\.gz/{n; s|sha256 \".*\"|sha256 \"$$SHA_LINUX_AMD64\"|;}" \
		"$$FORMULA_FILE"
	echo "updated $$FORMULA_FILE to v$(VERSION)"
	git add "$$FORMULA_FILE"
	git commit -m "feat: update $(FORMULA) formula to v$(VERSION)"
	git push
	echo "done — $(FORMULA) v$(VERSION) pushed"
