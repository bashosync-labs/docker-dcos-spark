#!/bin/bash
source /opt/dcos-cli/cli/bin/env-setup-dev

dcos config set core.email "dcos"
dcos config set core.reporting "false"
dcos config set package.cache /tmp/dcos
dcos config set package.sources '["https://github.com/mesosphere/universe/archive/version-1.x.zip"]'
dcos config prepend package.sources https://github.com/basho-labs/riak-mesos-dcos-repo/archive/0.3.0.zip
dcos package update
dcos package install --cli --yes riak
dcos package install --cli --yes kafka
dcos package install --cli --yes --package-version="1.5.0-multi-roles-v2" spark