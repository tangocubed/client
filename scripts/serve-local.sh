#!/usr/bin/env bash
set -e
SCRIPT_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
BASE_DIR=$(cd $SCRIPT_DIR && cd .. && pwd)

set -x

(
  cd $BASE_DIR &&
  flutter run -d web
)
