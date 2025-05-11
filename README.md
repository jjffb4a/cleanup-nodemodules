# 🧹 node_modules Cleaner + pnpm Reinstall Tool

Two-part shell script system to clean up heavy `node_modules` folders and selectively reinstall using `pnpm`.

## ✅ Usage

### 1. Clean and Log (`clean-node_modules-log.sh`)

Deletes `node_modules` folders and logs affected project paths to a JSON file.

```bash
./clean-node_modules-log.sh [-d depth] [optional_root_folder]
```

- `-d` = max directory depth to scan (default: `6`)
- `[optional_root_folder]` = where to search, defaults to `~/projects`
- Output is saved to `pnpm-reinstall.json` (in valid JSON format)
- You can edit this file to control which folders are reinstalled later

Example:
```bash
./clean-node_modules-log.sh -d 4 ~/workspace
```

### 2. Reinstall (`pnpm-reinstall-from-json.sh`)

Installs dependencies using `pnpm` for each folder listed in `pnpm-reinstall.json`.

```bash
./pnpm-reinstall-from-json.sh
```

Each folder will run:
```bash
cd <folder> && pnpm install
```

### 🧪 Example Workflow

1. Clean old installs:
   ```bash
   ./clean-node_modules-log.sh -d 5 ~/dev
   ```
2. Edit `pnpm-reinstall.json` to keep only relevant folders
3. Reinstall only selected projects:
   ```bash
   ./pnpm-reinstall-from-json.sh
   ```

## 📦 Requirements

- `zsh`
- `pnpm`
- `jq` (`brew install jq` if missing)

## 💡 Tip

This tool is ideal for reclaiming space across many projects, while still letting you selectively reinstall where needed.