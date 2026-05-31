#!/bin/bash
FANTTI_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

source "$FANTTI_DIR/.env"

echo "Checking fanttimoon..."
# check storage
if [ -d "$FANTTIMOON_STORAGE_DIR" ];
then
    echo "=== storage dir found"
else
    echo "storage dir not found"
fi
# check secret
if [ -f "./${FANTTIMOON_SECRET_FILE}" ];
then
    echo " == secret ok"
else
    echo "== secret not found"
fi
echo "everything ok"
