#!/bin/bash
set -euo pipefail

# Load environment variables from .env
if [ ! -f .env ]; then
  echo "Error: .env file not found. Copy .env.example to .env and fill in your credentials."
  exit 1
fi

set -a
source .env
set +a

# Validate required variables
for var in BUNNY_STORAGE_ZONE BUNNY_STORAGE_PASSWORD BUNNY_PULL_ZONE_ID BUNNY_API_KEY; do
  if [ -z "${!var:-}" ]; then
    echo "Error: $var is not set in .env"
    exit 1
  fi
done

DIST_DIR="dist"

# Build the site
echo "Building Astro site..."
npm run build

# Collect file list into a temp file to avoid pipe subshell issues
FILE_LIST=$(mktemp)
trap 'rm -f "$FILE_LIST"' EXIT
find "$DIST_DIR" -type f > "$FILE_LIST"

total=$(wc -l < "$FILE_LIST")
echo "Uploading $total files to Bunny Storage..."

failed=0
count=0
while IFS= read -r file; do
  count=$((count + 1))
  remote_path="${file#$DIST_DIR/}"
  encoded_path=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$remote_path'))")
  printf "  [%d/%d] Uploading: %s" "$count" "$total" "$remote_path"

  http_code=$(curl -s -o /dev/null -w "%{http_code}" -X PUT \
    "https://storage.bunnycdn.com/$BUNNY_STORAGE_ZONE/$encoded_path" \
    -H "AccessKey: $BUNNY_STORAGE_PASSWORD" \
    --data-binary "@$file" || true)

  if [ "$http_code" -eq 201 ] || [ "$http_code" -eq 200 ]; then
    echo " -> OK"
  else
    echo " -> FAILED (HTTP $http_code)"
    failed=$((failed + 1))
  fi
done < "$FILE_LIST"

echo "Upload complete: $((count - failed))/$count succeeded."

if [ "$failed" -gt 0 ]; then
  echo "Warning: $failed file(s) failed to upload."
fi

# Purge CDN cache
echo "Purging CDN cache for pull zone $BUNNY_PULL_ZONE_ID..."
http_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST \
  "https://api.bunny.net/pullzone/$BUNNY_PULL_ZONE_ID/purgeCache" \
  -H "AccessKey: $BUNNY_API_KEY" || true)
if [ "$http_code" -eq 200 ] || [ "$http_code" -eq 204 ]; then
  echo "Cache purged successfully."
else
  echo "Warning: cache purge returned HTTP $http_code"
fi

echo "Deployment complete!"
