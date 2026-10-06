#!/bin/bash
# Double-click to publish couch-kid.com
cd "$(dirname "$0")" || exit 1
rm -f .git/index.lock

finish() {
  echo ""
  read -n 1 -s -r -p "Press any key to close."
  exit "$1"
}

echo "Publishing couch kid..."
git add -A -- . ':!Claude outputs' ':!.claude'
if git diff --cached --quiet; then
  echo "No new edits on this computer."
else
  git commit -q -m "Site update $(date '+%Y-%m-%d %H:%M')" || finish 1
fi

# Bring in changes made on GitHub (e.g. merged pull requests) before publishing
echo "Getting the latest version from GitHub..."
if ! git pull --no-rebase --no-edit; then
  git merge --abort 2>/dev/null
  echo ""
  echo "Couldn't combine your edits with the latest version on GitHub"
  echo "(the same part of a page was changed in both places)."
  echo "Nothing was published, and your edits are saved on this computer — ask Claude for help."
  finish 1
fi

if [ -z "$(git log @{u}..HEAD --oneline)" ]; then
  echo "Nothing new to publish — your copy is up to date."
  finish 0
fi

git push || finish 1
echo ""
echo "Done! couch-kid.com will update in about a minute."
finish 0
