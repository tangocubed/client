#!/usr/bin/env bash
set -e
SCRIPT_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
BASE_DIR=$(cd $SCRIPT_DIR && cd .. && pwd)

set -x

(
  cd $BASE_DIR &&
  dartfmt -w . &&
  flutter pub get &&
  flutter packages pub run build_runner build &&
  flutter test
)
