#!/usr/bin/env bash

[[ -f "/tmp/kf5_dep_map" ]] && rm /tmp/kf5_dep_map

for formula in `ls kf5-*.rb`; do
  for dep in `grep "depends_on" $formula | awk -F "\"" '{print $2}'`; do
    echo "${dep/chigraph\/kf5\//} ${formula//\.rb/}" >> /tmp/kf5_dep_map
  done
done

tsort /tmp/kf5_dep_map > /tmp/kf5_install_order

for deps in `cat /tmp/kf5_install_order | grep -v kf5`; do
  brew install "$@" "${deps}"
done

for formula in `cat /tmp/kf5_install_order | grep kf5`; do
  brew install --build-bottle "$@" "${formula}"
  if [ "$formula" == "kf5-kcoreaddons" ]; then
    brew link --overwrite "$@" "${formula}"
  fi
  brew bottle "$@" "${formula}"
done
