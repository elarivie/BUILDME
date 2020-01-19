#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# pylint: disable=invalid-name


"""This is an entry point for the executable file BUILDME.

The current file:
	Should be named "BUILDME.py"
	Should be present in the project root folder
"""

import sys; sys.dont_write_bytecode = True; sys.stdout.reconfigure(encoding="utf-8")  # type: ignore[attr-defined]  # noqa: E702 F821

from typing import Sequence  # pylint: disable=wrong-import-position
import subprocess  # pylint: disable=wrong-import-position


def main(p_args: Sequence[str]) -> int:
	"""Entry point."""
	c_args = [sys.executable, "-B", "BUILDME"]
	c_args.extend(p_args)
	return subprocess.call(c_args)


if "__main__" == __name__:
	sys.dont_write_bytecode = True
	sys.exit(main(sys.argv[1:]))
