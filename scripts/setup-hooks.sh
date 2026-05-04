#!/usr/bin/env bash
#
# Configure git hooks for this repository.
#
# Usage:
#   ./scripts/setup-hooks.sh          # recommended: git core.hooksPath
#   ./scripts/setup-hooks.sh --copy   # copy into .git/hooks
#

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
HOOK_SRC="$REPO_ROOT/.githooks/pre-push"
HOOKS_DIR="$REPO_ROOT/.githooks"

if [[ ! -f "$HOOK_SRC" ]]; then
	echo "Missing hook source at $HOOK_SRC"
	exit 1
fi

chmod +x "$HOOK_SRC"

if [[ "${1:-}" == "--copy" ]]; then
	if [[ ! -d "$REPO_ROOT/.git/hooks" ]]; then
		echo "Cannot find .git/hooks in $REPO_ROOT"
		exit 1
	fi
	cp "$HOOK_SRC" "$REPO_ROOT/.git/hooks/pre-push"
	chmod +x "$REPO_ROOT/.git/hooks/pre-push"
	echo "Installed pre-push hook into .git/hooks/pre-push"
	exit 0
fi

git config core.hooksPath "$HOOKS_DIR"
echo "Configured git core.hooksPath=$HOOKS_DIR"
echo "Pre-push hook enabled."
