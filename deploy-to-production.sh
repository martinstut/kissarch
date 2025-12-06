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
SOURCE_CONF_PATH=./etc-kissarch
TARGET_CONF_PATH=/etc/kissarch
SOURCE_CRON_DAILY_PATH=./cron.daily
TARGET_CRON_DAILY_PATH=/etc/cron.daily
SOURCE_CRON_MONTHLY_PATH=./cron.monthly
TARGET_CRON_MONTHLY_PATH=/etc/cron.monthly

RSYNC_OPTS="-avP"

# send configuration for DAILY:
CONF_FILES="paths.conf digest.conf"
for FILE in $CONF_FILES ; do
    # shellcheck disable=SC2086
    rsync $RSYNC_OPTS "$SOURCE_CONF_PATH/$FILE" $TARGET_USER@$TARGET_SERVER:$TARGET_CONF_PATH/
done

# send cron for DAILY:
CRON_DAILY_FILES="kissarch-fixate"
for FILE in $CRON_DAILY_FILES ; do
    # shellcheck disable=SC2086
    rsync $RSYNC_OPTS "$SOURCE_CRON_DAILY_PATH/$FILE" $TARGET_USER@$TARGET_SERVER:$TARGET_CRON_DAILY_PATH/
done

# send cron for MONTHLY:
CRON_MONTHLY_FILES="kissarch-0digest kissarch-diff"
for FILE in $CRON_MONTHLY_FILES ; do
    # shellcheck disable=SC2086
    rsync $RSYNC_OPTS "$SOURCE_CRON_MONTHLY_PATH/$FILE" $TARGET_USER@$TARGET_SERVER:$TARGET_CRON_MONTHLY_PATH/
done

# send executables:
EXE_FILES="kissarch-fixate-all kissarch-fixate-1 kissarch-immutable-1-file kissarch-digest-file kissarch-digest-1 kissarch-digest-all"
for FILE in $EXE_FILES ; do
    # shellcheck disable=SC2086
    rsync $RSYNC_OPTS "$SOURCE_EXE_PATH/$FILE" $TARGET_USER@$TARGET_SERVER:$TARGET_EXE_PATH/
done
