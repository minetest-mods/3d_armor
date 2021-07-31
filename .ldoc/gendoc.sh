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

cmd_ldoc="${d_ldoc}/ldoc/ldoc.lua"
if test -f "${cmd_ldoc}"; then
	if test ! -x "${cmd_ldoc}"; then
		chmod +x "${cmd_ldoc}"
	fi
else
	cmd_ldoc="ldoc"
fi


# clean old files
rm -rf "${d_export}"

# generate items, settings, & crafts topics temp files
echo -e "\ngenerating temp files ..."
for script in "src" "settings" "crafts"; do
	script="${d_ldoc}/parse_${script}.py"
	if test ! -f "${script}"; then
		echo "ERROR: script doesn't exist: ${script}"
	else
		# check script's executable bit
		if test ! -x "${script}"; then
			chmod +x "${script}"
		fi
		# execute script
		"${script}"
	fi
done

echo

# generate new doc files
"${cmd_ldoc}" --UNSAFE_NO_SANDBOX -c "${f_config}" -d "${d_export}" "${d_root}" && retval=$?

# check exit status
if test ${retval} -ne 0; then
	echo -e "\nan error occurred (ldoc return code: ${retval}"
	exit ${retval}
fi

echo -e "\ncleaning temp files ..."
rm -vf "${d_ldoc}/"*.luadoc

echo -e "\nDone!"
