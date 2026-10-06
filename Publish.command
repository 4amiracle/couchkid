#!/bin/bash
# Double-click to publish couch-kid.com
cd "$(dirname "$0")" || exit 1
rm -f .git/index.lock
echo "Publishing couch kid..."
git add -A -- . ':!Claude outputs' ':!.claude'
if git diff --cached --quiet; then
  echo "Nothing new to publish."
else
  git commit -m "Site update $(date '+%Y-%m-%d %H:%M')" && git push && \
  echo "" && echo "Done! couch-kid.com will update in about a minute."
fi
echo ""
read -n 1 -s -r -p "Press any key to close."
