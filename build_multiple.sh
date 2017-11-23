#!/usr/bin/env bash
scala_versions=(
  2.11.12
  2.12.4
)
sbt_versions=(
  0.13.15
)
for scala_version in ${scala_versions[@]}; do
  for sbt_version in ${sbt_versions[@]}; do
    version=scala-${scala_version}-sbt-${sbt_version}
    docker build -t gnames/scala-sbt-jdk:${version} --build-arg SCALA_VERSION=${scala_version} --build-arg SBT_VERSION=${sbt_version} .
    docker push gnames/scala-sbt-jdk:${version}
    echo "Built ${version}"
  done
done
