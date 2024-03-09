#!/bin/bash
rm -rf .multi_opk
cp -r data .multi_opk

DEVS="gcw0 lepus rs90 rg99"

for TARGET in $DEVS
    do CONFIG=$TARGET make all opk && cp regba.$TARGET .multi_opk && CONFIG=$TARGET make clean
done

mksquashfs .multi_opk regba_multi-$(date +"%Y%m%d").opk -all-root -noappend -no-exports -no-xattrs -no-progress >/dev/null
