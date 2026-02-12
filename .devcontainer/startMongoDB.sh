#!/bin/bash
set -euo pipefail

WORKSPACE_DIR="/workspaces/skills-copilot-code-review"
DATA_DIR="$WORKSPACE_DIR/.mongo/data"
LOG_DIR="$WORKSPACE_DIR/.mongo/log"
LOG_PATH="$LOG_DIR/mongod.log"

mkdir -p "$DATA_DIR" "$LOG_DIR"

if pgrep -x mongod >/dev/null 2>&1; then
	echo "MongoDB is already running."
else
	mongod --dbpath "$DATA_DIR" --bind_ip 127.0.0.1 --fork --logpath "$LOG_PATH" --nounixsocket
	echo "MongoDB has been started successfully!"
fi

mongod --version

echo "Current databases:"
mongosh --eval "db.getMongo().getDBNames()"