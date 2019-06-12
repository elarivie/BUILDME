#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# This is an entry point for the file BUILDME
# The current file:
#     Should be named "BUILDME.py"
#     Should be present in the project root folder

from typing import Sequence

import subprocess
import sys


def main(p_args: Sequence[str]) -> int:
	"""Main."""
	c_args = [sys.executable, "-B", "BUILDME"]
	c_args.extend(p_args)
	return subprocess.call(c_args)


if __name__ == '__main__':
	sys.dont_write_bytecode = True
	sys.exit(main(sys.argv[1:]))
