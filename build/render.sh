#!/bin/bash
# usage: render.sh [slide numbers...]  (default: all 23)
D="$(cd "$(dirname "$0")" && pwd)"; mkdir -p "$D/png"
CH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
N=${@:-$(seq 1 23)}
for i in $N; do
  perl -e "alarm 40; exec @ARGV" "$CH" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --window-size=1920,1080 \
    --virtual-time-budget=6000 --allow-file-access-from-files --screenshot="$D/png/s$(printf %02d $i).png" \
    "file://$D/slides.html?s=$i" >/dev/null 2>&1
done
