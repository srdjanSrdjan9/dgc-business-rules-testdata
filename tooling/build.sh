#!/bin/sh

# Builds the tooling, and runs the validation.

DCC_BR_REPO_NAME=dgc-business-rules

# build all CertLogic dependencies:
git clone --depth 1 https://github.com/ehn-dcc-development/$DCC_BR_REPO_NAME.git
# locally, use:   ln -s ../../$DCC_BR_REPO_NAME .
cd $DCC_BR_REPO_NAME/certlogic
./build-js.sh
cd ../..

# get JSON Schema:
curl https://raw.githubusercontent.com/eu-digital-green-certificates/dgc-gateway/main/src/main/resources/validation-rule.schema.json > validation-rule.schema.json

# build and run validation and testing tooling:
npm run clean
npm install
npm run build
npm test

