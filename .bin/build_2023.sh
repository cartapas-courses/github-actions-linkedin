#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

function main() {
	if [ $# -ne 2 ]; then
		echo "ERROR: Check the script input parameters"
        echo "Usage: $0 ENVIRONMENT COMMIT_ID"
        echo "E.g. $0 develop 6dea003"
        echo "E.g. $0 staging 6dea003"
        echo "E.g. $0 master 6dea003"
        exit
    fi

	environment=$1
	commit_id=$2

	commit_id_short=${commit_id::7}

	echo "Branch: $environment"
	echo "Commit: $commit_id_short"

}

main "$@"
