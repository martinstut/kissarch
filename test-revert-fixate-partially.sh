#!/usr/bin/env bash
# ./test-revert-fixate-partially.sh
# reverts a few of the fixations of kissarch-fixate-all in the test-environment
# relies on a certain layout of the test archives
set -x
set -u
set -e

REVERT_FILES="./test-archive-old/company1/2025/from_debitors/invoice1.txt"

for FILE in $REVERT_FILES ; do
    chattr -i "$FILE" 
    chmod 775 "$FILE"
done
