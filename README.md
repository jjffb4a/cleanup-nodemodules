# 🧹 node_modules Cleaner + pnpm Reinstall Tool

This 2-script toolkit helps you clean up bloated `node_modules` folders across many projects and selectively reinstall using `pnpm`.

---

## ✅ Part 1: Clean and Log  
Script: `clean-node_modules-log.sh`

### 🔧 Basic Syntax
```bash
./clean-node_modules-log.sh [-d N] [--no-depth] [-v] [folder]
```

| Option         | Description                                      |
|----------------|--------------------------------------------------|
| `-d N`         | Max depth to scan (default: 6)                   |
| `--no-depth`   | Unlimited depth (overrides `-d`)                 |
| `-v`           | Verbose logging to `scan.log`                    |
| `[folder]`     | Root folder to scan (default: `~/projects`)      |

---

### 🌐 Root Folder Notes

- Use `.` to scan the **current folder**:
  ```bash
  ./clean-node_modules-log.sh .
  ```
- Use `~` to scan your home directory:
  ```bash
  ./clean-node_modules-log.sh --no-depth ~
  ```
- Use absolute or relative paths:
  ```bash
  ./clean-node_modules-log.sh -d 4 ~/Downloads
  ./clean-node_modules-log.sh ../work
  ```

---

### 📁 Output Files

- `pnpm-reinstall.json`: list of project folders to reinstall later
- `scan.log`: full list of scanned folders (even skipped ones)

---

### 🧪 Examples

- Clean deeply nested projects:
  ```bash
  ./clean-node_modules-log.sh --no-depth -v ~/code
  ```

- Limit scan to depth 3 for speed:
  ```bash
  ./clean-node_modules-log.sh -d 3 .
  ```

- Scan a mounted external drive:
  ```bash
  ./clean-node_modules-log.sh -d 8 /Volumes/SSD/dev
  ```

---

## ✅ Part 2: Reinstall  
Script: `pnpm-reinstall-from-json.sh`

### 🔧 Basic Syntax
```bash
./pnpm-reinstall-from-json.sh [--dry-run]
```

| Option         | Description                                      |
|----------------|--------------------------------------------------|
| `--dry-run`    | Prints folders but doesn’t run `pnpm install`    |

---

### 🧪 Examples

- Run all installs from JSON:
  ```bash
  ./pnpm-reinstall-from-json.sh
  ```

- Dry-run to preview actions:
  ```bash
  ./pnpm-reinstall-from-json.sh --dry-run
  ```

- Combine with JSON editing:
  1. Clean folders and create `pnpm-reinstall.json`
  2. Edit it manually to remove some entries
  3. Run reinstall only where needed

---

## 📦 Requirements

- `zsh`
- `pnpm`
- `jq` (install via `brew install jq`)

---

## 💡 Tip

This tool is ideal for cleaning up long-lived development folders, reclaiming disk space, and only rebuilding projects you still care about. Perfect for `~/Downloads`, `~/code`, `~/projects`, or mounted archives.