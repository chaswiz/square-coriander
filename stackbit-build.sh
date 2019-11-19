#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dd3b573aac7e400194afb1c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dd3b573aac7e400194afb1c
curl -s -X POST https://api.stackbit.com/project/5dd3b573aac7e400194afb1c/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5dd3b573aac7e400194afb1c/webhook/build/publish > /dev/null
