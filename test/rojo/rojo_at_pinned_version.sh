#!/bin/bash

# This test file will be executed against one of the scenarios that
# includes the 'rojo' feature with "version": "7.7.1".

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "rojo version" rojo --version
check "rojo managed by rokit" grep -q "rojo-rbx/rojo@7.7.1" "${HOME}/.rokit/rokit.toml"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
