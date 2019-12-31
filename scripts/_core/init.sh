#!/usr/bin/env zsh

for l in "${DOT_SCRIPTS_PATH}/_core/lib/"*".sh"; do
  source $l
done
