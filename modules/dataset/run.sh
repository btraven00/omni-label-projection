#!/usr/bin/env bash
# Data stage: fetch a common dataset (OpenProblems publishes them on S3).
set -euo pipefail
while [ $# -gt 0 ]; do
  case "$1" in --output) out=${2#*=} ;; --url) url=$2 ;; esac; shift 2
done
python -c 'import sys, urllib.request; urllib.request.urlretrieve(sys.argv[1], sys.argv[2])' "$url" "$out"
