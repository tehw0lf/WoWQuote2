#!/usr/bin/env bash
# Packages the three client-variant release archives into Release/.
#
# A thin wrapper around insert_and_build.py so CI can invoke one entry point,
# and so the Python version requirement is checked with a clear message rather
# than surfacing as a SyntaxError on an old interpreter.
set -euo pipefail

cd "$(dirname "$0")"

if ! command -v python3 >/dev/null 2>&1; then
	echo "error: python3 is required but not installed" >&2
	exit 1
fi

# insert_and_build.py uses builtin generic annotations (list[str]), which are a
# syntax error before 3.9.
if ! python3 -c 'import sys; sys.exit(0 if sys.version_info >= (3, 9) else 1)'; then
	echo "error: python3 3.9 or newer is required (found $(python3 --version 2>&1))" >&2
	exit 1
fi

python3 insert_and_build.py

echo
echo "archives in Release/:"
ls -1 Release/ | sed 's/^/  /'
