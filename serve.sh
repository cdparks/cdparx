#!/bin/sh

set -eu

python3 -m http.server --directory . &
server=$!
trap "kill $server" SIGINT SIGTERM EXIT
sleep 1

if [ `uname` == "Darwin" ]; then
  open http://localhost:8000/index.html
fi

wait $server
