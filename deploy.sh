#!/usr/bin/env bash
# Deploy this folder to GitHub Pages.
#
# Usage:
#   ./deploy.sh                  # creates <username>.github.io (root site)
#   ./deploy.sh academic-site    # creates a project site
#
# Requirements: git, GitHub CLI (gh), and a GitHub login.
#   brew install gh
#   gh auth login

set -euo pipefail

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) is not installed."
  echo "Install it with:  brew install gh"
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "You are not logged in to GitHub."
  echo "Run:  gh auth login"
  exit 1
fi

USER="$(gh api user -q .login)"
REPO_NAME="${1:-${USER}.github.io}"

echo "GitHub user:  $USER"
echo "Repository:   $REPO_NAME"
echo "Visibility:   public"
echo
echo "This will create (or update) a public repository and publish the site."
read -r -p "Continue? [y/N] " answer
case "$answer" in
  [yY]*) ;;
  *) echo "Aborted."; exit 0 ;;
esac

# A local git identity is needed for the first commit.
if ! git config user.name >/dev/null 2>&1; then
  git config user.name "$USER"
fi
if ! git config user.email >/dev/null 2>&1; then
  git config user.email "${USER}@users.noreply.github.com"
fi

if [ ! -d .git ]; then
  git init
  git branch -M main
fi

git add -A
git commit -m "Initial personal website" >/dev/null 2>&1 || true

if gh repo view "$USER/$REPO_NAME" >/dev/null 2>&1; then
  echo
  echo "Repository already exists: https://github.com/$USER/$REPO_NAME"
  read -r -p "Push to it and update the site? [y/N] " answer
  case "$answer" in
    [yY]*) ;;
    *) echo "Aborted."; exit 0 ;;
  esac
  git remote remove origin >/dev/null 2>&1 || true
  git remote add origin "https://github.com/$USER/$REPO_NAME.git"
  git push -u origin main
else
  gh repo create "$USER/$REPO_NAME" --public --source=. --remote=origin --push
fi

# Enable Pages from main / root. Ignore "already enabled" errors.
gh api -X POST "repos/$USER/$REPO_NAME/pages" \
  -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 || true

if [ "$REPO_NAME" = "${USER}.github.io" ]; then
  URL="https://${USER}.github.io/"
else
  URL="https://${USER}.github.io/${REPO_NAME}/"
fi

echo
echo "Done. GitHub Pages may take a minute to build:"
echo "  $URL"
