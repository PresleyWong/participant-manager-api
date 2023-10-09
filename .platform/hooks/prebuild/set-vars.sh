#!/bin/bash

# put envars into /etc/profile.d/sh.local so that they an be used to `bundle exec rails c`
# see https://aws.amazon.com/premiumsupport/knowledge-center/elastic-beanstalk-env-variables-shell/

# installs `jq` to transform the json representation of the env vars
# into shell-happy looking env-vars
yum install -y jq

# write your eb environment variables to /etc/profile.d/sh.local
/opt/elasticbeanstalk/bin/get-config environment | jq -r 'to_entries | .[] | "export \(.key)=\"\(.value)\""' > /etc/profile.d/sh.local