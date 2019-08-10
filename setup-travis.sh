#!/bin/bash

set -eu

source .travis.env
# Needs:
# TRAVIS_TOKEN=
# CI_AUTHOR_EMAIL=
# CI_AUTHOR_NAME=
# CI_GH_TOKEN=
# CI_NPM_TOKEN=
# CI_REPO=

curl --silent --show-error --fail -X POST \
  -H "Content-Type: application/json" \
  -H "Travis-API-Version: 3" \
  -H "Authorization: token $TRAVIS_TOKEN" \
  -d '{ "env_var.name": "GIT_AUTHOR_EMAIL", "env_var.value": "$CI_AUTHOR_EMAIL", "env_var.public": false, "env_var.branch": "master" }' \
  https://api.travis-ci.com/repo/$CI_REPO/env_vars

curl --silent --show-error --fail -X POST \
  -H "Content-Type: application/json" \
  -H "Travis-API-Version: 3" \
  -H "Authorization: token $TRAVIS_TOKEN" \
  -d '{ "env_var.name": "GIT_COMMITTER_EMAIL", "env_var.value": "$CI_AUTHOR_EMAIL", "env_var.public": false, "env_var.branch": "master" }' \
  https://api.travis-ci.com/repo/$CI_REPO/env_vars

curl --silent --show-error --fail -X POST \
  -H "Content-Type: application/json" \
  -H "Travis-API-Version: 3" \
  -H "Authorization: token $TRAVIS_TOKEN" \
  -d '{ "env_var.name": "GIT_AUTHOR_NAME", "env_var.value": "$CI_AUTHOR_NAME", "env_var.public": false, "env_var.branch": "master" }' \
  https://api.travis-ci.com/repo/$CI_REPO/env_vars

curl --silent --show-error --fail -X POST \
  -H "Content-Type: application/json" \
  -H "Travis-API-Version: 3" \
  -H "Authorization: token $TRAVIS_TOKEN" \
  -d '{ "env_var.name": "GIT_COMMITTER_NAME", "env_var.value": "$CI_AUTHOR_NAME", "env_var.public": false, "env_var.branch": "master" }' \
  https://api.travis-ci.com/repo/$CI_REPO/env_vars

curl --silent --show-error --fail -X POST \
  -H "Content-Type: application/json" \
  -H "Travis-API-Version: 3" \
  -H "Authorization: token $TRAVIS_TOKEN" \
  -d '{ "env_var.name": "GH_TOKEN", "env_var.value": "$CI_GH_TOKEN", "env_var.public": false, "env_var.branch": "master" }' \
  https://api.travis-ci.com/repo/$CI_REPO/env_vars

curl --silent --show-error --fail -X POST \
  -H "Content-Type: application/json" \
  -H "Travis-API-Version: 3" \
  -H "Authorization: token $TRAVIS_TOKEN" \
  -d '{ "env_var.name": "NPM_TOKEN", "env_var.value": "$CI_NPM_TOKEN", "env_var.public": false, "env_var.branch": "master" }' \
  https://api.travis-ci.com/repo/$CI_REPO/env_vars

rm .travis.env
rm setup-travis.sh
