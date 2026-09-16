#!/usr/bin/env bash
set -euo pipefail

root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

run_case() {
    local input="$1"
    local expected="$2"
    local actual
    actual=$(printf '%s' "$input" | "$root/solution.sh")
    [[ "$actual" == "$expected" ]] || {
        printf 'FAIL\nInput:\n%s\nExpected:\n%s\nActual:\n%s\n' "$input" "$expected" "$actual" >&2
        exit 1
    }
}

run_case $'2\n1\n0\n' $'1\n111'
run_case $'3\n7\n8\n123\n' $'7\n711\n111111'
run_case $'1\n9\n' '111'
run_case $'1\n88\n' '1111111'

printf 'All Seven Segment Maximum tests passed.\n'
