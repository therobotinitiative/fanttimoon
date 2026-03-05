#!/bin/bash
FANTTI_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

source "$FANTTI_DIR/../bash/forest.functions.sh"

# Load gradle.properties into associative array
declare -A properties
forest_load_properties properties "$FANTTI_DIR/gradle.properties"

USER_SECRET="$FANTTI_DIR/${properties[fantti.user.secret]}"

# Verify that the secret files exist
check_secret_file "$USER_SECRET"
verify_storage_directory "${properties[fantti.storage]}"
forestnetwork=$(forest_resolve_network_name "$FANTTI_DIR/../gradle.properties")

# Run the docker container for Fantti
docker run -d --name fantti-moon \
                --mount type=bind,src="${USER_SECRET}",target=/run/secret/passord.secret,readonly \
                -e POSTGRES_PASSWORD_FILE=/run/secret/passord.secret \
                -e POSTGRES_USER="${properties[fantti.user]}" \
                -e POSTSRES_DB="${properties[fantti.database]}" \
                -p "${properties[fantti.port]}":5432 \
                -v "${properties[fantti.storage]}":/var/lib/postres/data \
                --network="${forestnetwork}" \
                "${properties[fantti.image.name]}":"${properties[fantti.image.version]}"
