#!/bin/bash

# This test file will be executed against one of the scenarios that
# includes the 'rojo' feature with "toolchainManager": "rokit".

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "rokit version" rokit --version
check "rojo version" rojo --version
check "rojo as root" sudo rojo --version
check "rojo managed by rokit" grep -q "rojo-rbx/rojo" "${HOME}/.rokit/rokit.toml"
check "rokit profile" grep -q '\$HOME/.rokit/bin' /etc/profile.d/rokit.sh
check "rokit bin in PATH" bash -lc 'case ":$PATH:" in *:"$HOME/.rokit/bin":*) true ;; *) false ;; esac'

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
