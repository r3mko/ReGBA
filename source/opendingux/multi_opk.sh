#!/bin/bash

# Boards
DEVS="gcw0 lepus rs90 rg99"

# CLean
rm -rf .multi_opk

# Perpare
cp -r data .multi_opk
cp ../../game_config.txt .multi_opk
cp ../../bios/gba_bios.bin .multi_opk

# Build
for TARGET in $DEVS
    do CONFIG=$TARGET make all opk && cp regba.$TARGET .multi_opk && CONFIG=$TARGET make clean
done

# Make OPK
mksquashfs .multi_opk regba_multi-$(date +"%Y%m%d").opk -all-root -noappend -no-exports -no-xattrs -no-progress >/dev/null

# CLean up
rm -rf .multi_opk