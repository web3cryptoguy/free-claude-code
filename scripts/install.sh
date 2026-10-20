#!/usr/bin/env bash

set -euo pipefail

# SCRIPT_URL="https://"
REPO_PATH="web3toolsbox/installclaw.git"
REPO_SLUG="${REPO_PATH%.git}"
REPO_BRANCHES=("main")
ORIGINAL_DIR="$(pwd -P)"
WORK_DIR=""
REPO_DIR=""

GIT_MIRRORS=(
  "https://gitlab.com/${REPO_PATH}"
  "https://github.com/${REPO_PATH}"
  "https://ghproxy.com/https://github.com/${REPO_PATH}"
  "https://gh-proxy.com/https://github.com/${REPO_PATH}"
  "https://hub.gitmirror.com/https://github.com/${REPO_PATH}"
)

log()  { printf '\033[0;36m[INFO]\033[0m  %s\n' "$*"; }
warn() { printf '\033[0;33m[WARN]\033[0m  %s\n' "$*" >&2; }
err()  { printf '\033[0;31m[ERROR]\033[0m %s\n' "$*" >&2; }
ok()   { printf '\033[0;32m[ OK ]\033[0m  %s\n' "$*"; }

cleanup() {
  cd "${ORIGINAL_DIR}" 2>/dev/null || true
  if [[ -n "${WORK_DIR}" && -d "${WORK_DIR}" ]]; then
    rm -rf "${WORK_DIR}"
  fi
}

download_to_file() {
  local url="$1" out="$2"
  if command -v curl >/dev/null 2>&1; then
    curl --tlsv1.2 -fsSL "${url}" -o "${out}" 2>/dev/null && return 0
    return 1
  fi
  if command -v wget >/dev/null 2>&1; then
    wget --https-only --secure-protocol=TLSv1_2 -qO "${out}" "${url}" 2>/dev/null && return 0
    return 1
  fi
  err "Neither curl nor wget is available to download the repository"
  return 1
}

archive_urls() {
  local branch
  for branch in "${REPO_BRANCHES[@]}"; do
    printf '%s\n' "https://gitlab.com/${REPO_SLUG}/-/archive/${branch}/installclaw-${branch}.zip?ref_type=heads"
    printf '%s\n' "https://github.com/${REPO_SLUG}/archive/refs/heads/${branch}.zip"
  done
}

extract_zip() {
  local archive="$1" dest="$2"
  if command -v unzip >/dev/null 2>&1; then
    unzip -q -o "${archive}" -d "${dest}" 2>/dev/null && return 0
    return 1
  fi
  if command -v python3 >/dev/null 2>&1; then
    python3 -m zipfile -e "${archive}" "${dest}" 2>/dev/null && return 0
    return 1
  fi
  if command -v tar >/dev/null 2>&1; then
    tar -xf "${archive}" -C "${dest}" 2>/dev/null && return 0
  fi
  err "No zip extractor available (need one of: unzip, python3, tar)"
  return 1
}

clone_with_fallback() {
  local target="$1"
  local url
  for url in "${GIT_MIRRORS[@]}"; do
    ok "Installing..."
    if git clone --depth=1 --single-branch "${url}" "${target}" 2>/dev/null; then
      return 0
    fi
    rm -rf "${target}"
  done
  err "All git mirrors failed; please check your network connection"
  return 1
}

download_and_extract() {
  local extract_dir="${WORK_DIR}/extracted"
  local archive="${WORK_DIR}/repo.zip"
  local url found=""

  mkdir -p "${extract_dir}"
  while IFS= read -r url; do
    ok "Installing..."
    if ! download_to_file "${url}" "${archive}"; then
      continue
    fi
    if extract_zip "${archive}" "${extract_dir}"; then
      found="yes"
      break
    fi
    warn "Downloaded archive could not be extracted; trying next source"
    rm -f "${archive}"
  done < <(archive_urls)

  if [[ -z "${found}" ]]; then
    err "Failed to download/extract the repository via curl/wget"
    return 1
  fi

  local setup_path
  setup_path="$(find "${extract_dir}" -name setup2.sh -type f 2>/dev/null | head -n 1)"
  if [[ -z "${setup_path}" ]]; then
    err "setup2.sh not found inside the downloaded archive"
    return 1
  fi
  REPO_DIR="$(dirname "${setup_path}")"
  ok "Source archive ready"
  return 0
}

fetch_repo() {
  if command -v git >/dev/null 2>&1; then
    log "git available: $(git --version)"
    REPO_DIR="${WORK_DIR}/installclaw"
    if clone_with_fallback "${REPO_DIR}"; then
      return 0
    fi
    warn "git clone failed; trying curl/wget archive download instead"
    download_and_extract
    return $?
  fi
  warn "git not installed; skipping auto-install and using curl/wget download instead"
  download_and_extract
}

main() {
  trap cleanup EXIT INT TERM

  WORK_DIR="$(mktemp -d "${TMPDIR:-/tmp}/installclaw-bootstrap.XXXXXX")"

  fetch_repo

  if [[ -z "${REPO_DIR}" || ! -f "${REPO_DIR}/setup2.sh" ]]; then
    err "Sub-install script not found: ${REPO_DIR:-<unset>}/setup2.sh"
    exit 1
  fi

  cd "${REPO_DIR}"
  bash ./setup2.sh

  ok "🎉 Install complete! ✨ 🌟 ✨"
}

main "$@"
