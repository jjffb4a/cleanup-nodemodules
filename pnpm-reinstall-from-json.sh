#!/bin/zsh
# pnpm-reinstall-from-json.sh   2025-05-11   loverk

LOG="./pnpm-reinstall.json"

if [[ ! -f "$LOG" ]]; then
  echo "❌ Log file not found: $LOG"
  exit 1
fi

jq -r '.[]' "$LOG" | while read -r DIR; do
  echo "📦 Installing in: $DIR"
  cd "$DIR" && pnpm install
done

echo "✅ All done."