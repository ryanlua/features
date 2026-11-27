#!/bin/bash

# This test file will be executed against one of the scenarios that
# includes the 'rojo' feature with "toolchainManager": "aftman".

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "aftman version" aftman --version
check "aftman profile" grep -q '\$HOME/.aftman/bin' /etc/profile.d/aftman.sh
check "aftman bin in PATH" bash -lc 'case ":$PATH:" in *:"$HOME/.aftman/bin":*) true ;; *) false ;; esac'

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
