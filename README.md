# 🧹 node_modules Cleaner + pnpm Reinstall Tool

Two-part shell script system to clean up heavy `node_modules` folders and selectively reinstall using `pnpm`.

## ✅ Usage

### 1. Clean and Log (`clean-node_modules-log.sh`)

Deletes `node_modules` folders and logs affected project paths.

```bash
./clean-node_modules-log.sh [optional_root_folder]
```

- If no path is given, defaults to `~/projects`
- Output saved to `pnpm-reinstall.json`

### 2. Reinstall (`pnpm-reinstall-from-json.sh`)

Installs dependencies only for logged folders.

```bash
./pnpm-reinstall-from-json.sh
```

Edit `pnpm-reinstall.json` manually to skip unwanted folders before running this.

## 📦 Requirements

- `zsh`
- `pnpm`
- `jq` (`brew install jq` if missing)

## 💡 Tip

Great for cleaning up old project trees without immediately rebuilding everything.
