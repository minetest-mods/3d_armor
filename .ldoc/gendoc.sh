#!/usr/bin/env bash

# Place this file in mod ".ldoc" directory.
#
# To change output directory set the `d_export` environment variable.
# Example:
#   $ d_export=/custom/path ./gendoc.sh


d_ldoc="$(dirname $(readlink -f $0))"
f_config="${d_ldoc}/config.ld"

cd "${d_ldoc}/.."

d_root="$(pwd)"
d_export="${d_export:-${d_root}/3d_armor/docs/reference}"


# clean old files
rm -rf "${d_export}"

# generate items & settings topics temp files
./.ldoc/parse_src.py
./.ldoc/parse_settings.py
./.ldoc/parse_crafts.py

echo

# generate new doc files
ldoc --UNSAFE_NO_SANDBOX --multimodule -c "${f_config}" -d "${d_export}" "${d_root}"
retval=$?
if test ${retval} -ne 0; then
	# doesn't support "UNSAFE_NO_SANDBOX" or "multimodule" flag
	echo
	ldoc -c "${f_config}" -d "${d_export}" "."
	retval=$?
	if test ${retval} -ne 0; then
		exit ${retval}
	fi
fi

# cleanup
rm -f ./.ldoc/*.luadoc

echo -e "\nDone!"
