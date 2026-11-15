#!/bin/sh
set -eu

REPO_ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
PREVIEW_PORT=${1:-${PREVIEW_PORT:-8000}}

case "$PREVIEW_PORT" in
  ''|*[!0-9]*)
    printf 'Port must be a number.\n' >&2
    exit 2
    ;;
esac

printf 'Previewing docs at http://127.0.0.1:%s/\n' "$PREVIEW_PORT"
printf 'Press Ctrl-C to stop the preview server.\n'
exec python3 -m http.server "$PREVIEW_PORT" --bind 127.0.0.1 --directory "$REPO_ROOT/docs"
