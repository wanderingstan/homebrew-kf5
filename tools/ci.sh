#!/usr/bin/env bash

if [[ -z "$KF5_TOTAL_PAGES" ]]; then
	echo "Please define KF5_TOTAL_PAGES for the total number of pages to build in"
	exit 1
fi

if [[ -z "$KF5_CURRENT_PAGE" ]]; then
	echo "Please define KF5_CURRENT_PAGE for the current page"
	exit 1
fi

if [[ "$KF5_CURRENT_PAGE" -ge "$KF5_TOTAL_PAGES" ]]; then
	echo "The current page cannot be greater or equal to the total pages"
	exit 1
fi

[[ -f "/tmp/kf5_dep_map" ]] && rm /tmp/kf5_dep_map



for formula in `ls kf5-*.rb`; do
  for dep in `grep "depends_on" $formula | awk -F "\"" '{print $2}'`; do
    echo "${dep/chigraph\/kf5\//} ${formula//\.rb/}" >> /tmp/kf5_dep_map
  done
done

tsort /tmp/kf5_dep_map > /tmp/kf5_install_order

readarray all_frameworks < 

declare -a all_frameworks
let i=0
while IFS=$'\n' read -r line_data; do
    all_frameworks[i]="${line_data}" # Populate array.
    ((++i))
done < <(cat /tmp/kf5_install_order | grep kf5 )

len_frameworks=${#all_frameworks[@]}

frameworks_per_page=$(( len_frameworks / KF5_TOTAL_PAGES ))
framework_to_start_on=$(( frameworks_per_page * KF5_CURRENT_PAGE ))
num_frameworks_to_build="$frameworks_per_page"

# if this is the last page, build all the rest to avoid rounding errors
if [[ "$KF5_CURRENT_PAGE" -eq $(( KF5_TOTAL_PAGES - 1 )) ]]; then
	num_frameworks_to_build=$(( len_frameworks - framework_to_start_on ))
fi

for deps in `cat /tmp/kf5_install_order | grep -v kf5`; do
  brew install "$@" "${deps}"
done

echo "Building: ${all_frameworks[@]:$framework_to_start_on:$num_frameworks_to_build}"
for formula in "${all_frameworks[@]:$framework_to_start_on:$num_frameworks_to_build}"; do
  if [ "$formula" == "kf5-kdoctools" ]; then
    cpanm URI
  fi
  brew install --build-bottle "$@" "${formula}"
  if [ "$formula" == "kf5-kcoreaddons" ]; then
    brew link --overwrite "$@" "${formula}"
  fi
  brew bottle "$@" "${formula}"
done
