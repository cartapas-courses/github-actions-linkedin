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

	branch=$1
	commit_id=$2

	commit_id_short=${commit_id::7}

	echo "Branch: $branch"
	echo "Commit: $commit_id_short"

	if [ "$branch" == "develop" ]
		then
			environment=DEVELOP
			DOCKER_IMAGE_URI=172259620592.dkr.ecr.us-east-1.amazonaws.com/www:${branch}.${commit_id_short}
	elif [ "$branch" == "staging" ]
		then
			environment=STAGING
			DOCKER_IMAGE_URI=172259620592.dkr.ecr.us-east-1.amazonaws.com/www:${branch}.${commit_id_short}
	elif [ "$branch" == "master" ]
		then
			environment=PRODUCTION
			DOCKER_IMAGE_URI=172259620592.dkr.ecr.us-east-1.amazonaws.com/www:${branch}.${commit_id_short}
	else
		environment="feature"
		DOCKER_IMAGE_URI=172259620592.dkr.ecr.us-east-1.amazonaws.com/www:feature.${commit_id_short}
	fi

	echo $environment

}

main "$@"