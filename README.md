#!/bin/zsh

# Defaults
ROOT="$HOME/projects"
DEPTH=6
VERBOSE=false
LOG="./pnpm-reinstall.json"
SCANLOG="./scan.log"

# Parse options
while getopts "d:v" opt; do
  case $opt in
    d) DEPTH=$OPTARG ;;
    v) VERBOSE=true ;;
    *) echo "Usage: $0 [-d depth] [-v] [optional_root_folder]"; exit 1 ;;
  esac
done
shift $((OPTIND - 1))
[[ -n "$1" ]] && ROOT="$1"

echo "📂 Scanning in: $ROOT (max depth $DEPTH)"
echo "📝 Logging to: $LOG"
echo "🧾 Verbose log: $SCANLOG"
> "$LOG"
> "$SCANLOG"

echo '[' >> "$LOG"
FIRST=true

find "$ROOT" -maxdepth "$DEPTH" -type d -name "node_modules" -prune | while read -r NODE_MODULES; do
  PROJECT_DIR="$(dirname "$NODE_MODULES")"

  # Log every folder scanned
  echo "$PROJECT_DIR" >> "$SCANLOG"

  if [[ -f "$PROJECT_DIR/package.json" || -f "$PROJECT_DIR/pnpm-lock.yaml" ]]; then
    echo "♻️  Deleting: $PROJECT_DIR/node_modules"
    rm -rf "$NODE_MODULES"

    # Add entry to JSON
    if $FIRST; then
      echo "  \"$PROJECT_DIR\"" >> "$LOG"
      FIRST=false
    else
      echo "  ,\"$PROJECT_DIR\"" >> "$LOG"
    fi
  else
    if $VERBOSE; then
      echo "⚠️  Skipped (no package.json): $PROJECT_DIR"
    fi
  fi
done

echo "]" >> "$LOG"
echo "✅ Done. JSON: $LOG, Full scan log: $SCANLOG"