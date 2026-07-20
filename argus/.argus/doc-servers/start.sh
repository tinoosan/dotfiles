#!/bin/sh
# Start the Argus documentation servers for LAN reading (iPad etc.).
# pkgsite  → Go API docs for the codebase   http://<mac-ip>:8080
# http.server → repo docs/ architecture HTML http://<mac-ip>:8090
set -e
ARGUS="$HOME/personal/dev/Projects/argus"
LOGDIR="$HOME/.argus/doc-servers"
mkdir -p "$LOGDIR"

if ! lsof -ti :8080 >/dev/null 2>&1; then
  (cd "$ARGUS" && nohup "$(go env GOPATH)/bin/pkgsite" -http=0.0.0.0:8080 . \
    > "$LOGDIR/pkgsite.log" 2>&1 &)
  echo "pkgsite started on :8080"
else
  echo "pkgsite already running on :8080"
fi

if ! lsof -ti :8090 >/dev/null 2>&1; then
  (cd "$ARGUS/docs" && nohup python3 -m http.server 8090 --bind 0.0.0.0 \
    > "$LOGDIR/docs.log" 2>&1 &)
  echo "repo docs started on :8090"
else
  echo "repo docs already running on :8090"
fi

echo "iPad URLs (same Wi-Fi): http://$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1):8080 and :8090"
