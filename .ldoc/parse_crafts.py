#!/usr/bin/env python

# This script will parse source files for craft recipes.

import sys, os, codecs, errno


path = os.path.realpath(__file__)
script = os.path.basename(path)
d_root = os.path.dirname(os.path.dirname(path))
d_ldoc = os.path.join(d_root, ".ldoc")

craftfile = os.path.realpath(os.path.join(d_root, "3d_armor/armor.lua"))
if not os.path.isfile(craftfile):
	print("ERROR: craft file does not exist for parsing: {}".format(craftfile))
	sys.exit(errnor.ENOENT)

buffer = codecs.open(craftfile, "r", "utf-8")
if not buffer:
	print("ERROR: could not open file for reading: {}".format(craftfile))
	sys.exit(errno.EIO)

data_in = buffer.read()
buffer.close()

craft = ""

data_in = data_in.replace("\r\n", "\n").replace("\r", "\n")
for sect in data_in.split("\n---"):
	if "@craft armor" in sect:
		sect = "---{}".format(sect)
		for li in sect.split("\n"):
			if li.startswith("--"):
				craft = "{}\n{}".format(craft, li)

outfile = os.path.join(d_ldoc, "crafting.luadoc")

buffer = codecs.open(outfile, "w", "utf-8")
if not buffer:
	print("ERROR: could not open file for writing: {}".format(outfile))
	sys.exit(errno.EIO)

buffer.write("\n--- 3D Armor Crafting\n--\n--  @topic crafting\n\n{}\n".format(craft))
buffer.close()

print("crafts exported to\t{}".format(outfile))
