#!/bin/bash

# set ${MONGODB_HOME} using env file
source ../env.sh


# set ${MONGODB_HOME} if not already set
[ -z "$MONGODB_HOME" ] && MONGODB_HOME=`cd $(dirname $0)/../../ >/dev/null; pwd`


# create data directory if not created
if [ ! -d ./data/mongod01b ]; then
   mkdir -p ./data/mongod01b 
fi

# run mongod
echo MONGODB_HOME=${MONGODB_HOME}

${MONGODB_HOME}/bin/mongod --dbpath ./data/mongod01b --port 27102 --replSet r1 --oplogSize 10 --logpath ./data/mongod01b/mongod.log --logappend --fork --rest --smallfiles

