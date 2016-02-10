#!/bin/bash

function die () {
  echo >&2 "${1}"
  exit 1
}

BASE=$(cd $(dirname $0) && pwd)

JAR=${BASE}/dist/JMapProjLib.jar

if [ ! -f ${JAR} ] ; then
  ant jar || die "$0: error building ${JAR}"
fi

mvn install:install-file \
 -DgroupId=com.jhlabs \
 -DartifactId=map \
 -Dpackaging=jar \
 -Dversion=1.0.0 \
 -Dfile=${JAR}
