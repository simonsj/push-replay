#!/bin/sh
# setup-workspace-revlist.sh <workspace-directory>

set -e

usage () {
  echo "Usage: setup-workspace-revlist.sh <workspace-directory>"
  exit 1
}

if [ $# -ne 1 ]; then
  usage
fi

WORKDIR=$(echo "$1" | sed -e 's@/$@@g')
WORKREVLIST="../$WORKDIR-revlist"

if [ ! -d $WORKDIR ]; then
  echo "failed: $WORKDIR does not seem to be a directory"
  exit 1
fi

(
  set -e
  cd $WORKDIR

  echo ""
  echo "$WORKDIR: reset --hard origin/master"
  git reset --hard origin/master

  echo ""
  echo "$WORKDIR: rev-list --reverse --first-parent HEAD"
  git rev-list --reverse --first-parent HEAD > $WORKREVLIST
)

echo "$WORKDIR: Done with revlist."
