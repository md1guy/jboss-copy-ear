#!/bin/bash

JBOSS_EAR_DIR="C:/DPPTools/jboss/server/default/deploy/"
JBOSS_EAR_PATTERN="dpo7-ear-*.ear"
MAVEN_EAR_DIR="C:/DPPSource/dpp7/dpo7-ear/target/"
MAVEN_EAR_PATTERN="dpo7-ear-*-SNAPSHOT"

del() {
    printf "Found old EAR: $1\n" &&
        rm -r $1 &&
        printf "Successfully deleted old EAR directory.\n"
}

export -f del

find ${JBOSS_EAR_DIR} -name ${JBOSS_EAR_PATTERN} -print0 |
    xargs -r -0 -n1 -I_filename -- sh -c 'del "_filename"'

name=$(find ${MAVEN_EAR_DIR} -name ${MAVEN_EAR_PATTERN} -print0 | tr '\0' '\n') &&
    cp -r ${name} ${JBOSS_EAR_DIR}${name##*/}.ear &&
    printf "EAR replaced successfully.\n"
