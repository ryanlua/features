#!/bin/bash

# This test file will be executed against one of the scenarios that
# includes the 'rojo' feature with "toolchainManager": "foreman".

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "foreman version" foreman --version
check "foreman profile" grep -q '\$HOME/.foreman/bin' /etc/profile.d/foreman.sh
check "foreman bin in PATH" bash -lc 'case ":$PATH:" in *:"$HOME/.foreman/bin":*) true ;; *) false ;; esac'

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
