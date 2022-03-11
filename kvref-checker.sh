#!/bin/sh

kvref_resolution_failures=$(printenv | grep "=@Microsoft.KeyVault(")

if [ -n "$kvref_resolution_failures" ]; then
    cat <<EOS >&2
[kvref-checker] ERROR: KeyVault reference resolution failure detected.
################################
$kvref_resolution_failures
################################
EOS
    exit 1
else
    echo "[kvref-checker] all KeyVault references have been successfully resolved."
fi

exec "$@"
