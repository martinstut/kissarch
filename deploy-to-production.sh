#!/usr/bin/env bash
# copies the current development state, except configuration, to the production target
set -x
set -u
set -e

TARGET_SERVER=miranda64
TARGET_USER=root
# no trailing slashes in paths:
SOURCE_EXE_PATH=.
TARGET_EXE_PATH=/usr/local/sbin
SOURCE_CRON_FIXATE_PATH=./cron.daily
TARGET_CRON_FIXATE_PATH=/etc/cron.daily
SOURCE_CRON_DIFF_PATH=./cron.monthly
TARGET_CRON_DIFF_PATH=/etc/cron.monthly

RSYNC_OPTS="-avP"
# send cron for fixate:
CRON_FIXATE_FILES="kissarch-fixate"
for FILE in $CRON_FIXATE_FILES ; do
    # shellcheck disable=SC2086
    rsync $RSYNC_OPTS "$SOURCE_CRON_FIXATE_PATH/$FILE" $TARGET_USER@$TARGET_SERVER:$TARGET_CRON_FIXATE_PATH/
done

# send cron for diff:
CRON_DIFF_FILES="kissarch-diff"
for FILE in $CRON_DIFF_FILES ; do
    # shellcheck disable=SC2086
    rsync $RSYNC_OPTS "$SOURCE_CRON_DIFF_PATH/$FILE" $TARGET_USER@$TARGET_SERVER:$TARGET_CRON_DIFF_PATH/
done

# send executables:
EXE_FILES="kissarch-fixate-1 kissarch-fixate-all"
for FILE in $EXE_FILES ; do
    # shellcheck disable=SC2086
    rsync $RSYNC_OPTS "$SOURCE_EXE_PATH/$FILE" $TARGET_USER@$TARGET_SERVER:$TARGET_EXE_PATH/
done
