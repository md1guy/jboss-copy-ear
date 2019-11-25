#!/bin/bash

JBOSS_EAR_DIR="C:/DPPTools/jboss/server/default/deploy"
JBOSS_EAR_PATTERN="dpo7-ear-*.ear"
MAVEN_EAR_DIR="C:/DPPSource/dpp7/dpo7-ear/target"
MAVEN_EAR_PATTERN="dpo7-ear-*-SNAPSHOT"

cd ${JBOSS_EAR_DIR} &&
    find . -name ${JBOSS_EAR_PATTERN} -print0 | xargs -0 rm -r &&
    printf "Successfully deleted old EAR directory."
cd ${MAVEN_EAR_DIR} &&
    name=$(find . -name ${MAVEN_EAR_PATTERN} -print0 | tr '\0' '\n') &&
    cp -r ${name} ${JBOSS_EAR_DIR}${name:1}.ear
