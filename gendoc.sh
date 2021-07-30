#!/usr/bin/env bash

# place this file in mod "docs" directory

root="$(dirname $(readlink -f $0))"
docs="${root}/3d_armor/docs"
config="${root}/.ldoc/config.ld"
export_dir="${export_dir:-${docs}/reference}"

cd "${root}"

# clean old files
rm -rf "${export_dir}"

# generate items & settings topics temp files
./.ldoc/parse_src.py
./.ldoc/parse_settings.py
./.ldoc/parse_crafts.py

echo

# generate new doc files
ldoc --UNSAFE_NO_SANDBOX --multimodule -c "${config}" -d "${export_dir}" "${root}"
retval=$?
if test ${retval} -ne 0; then
	# doesn't support "UNSAFE_NO_SANDBOX" or "multimodule" flag
	echo
	ldoc -c "${config}" -d "${export_dir}" "."
	retval=$?
	if test ${retval} -ne 0; then
		exit ${retval}
	fi
fi

# cleanup
rm -f ./.ldoc/*.luadoc

echo -e "\nDone!"
