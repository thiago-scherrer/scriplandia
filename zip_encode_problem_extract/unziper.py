#!/usr/bin/python
##Fonte: https://unix.stackexchange.com/a/498321

import zipfile
import sys

zipfile.ZipFile(sys.argv[1], 'r').extractall(sys.argv[2] if len(sys.argv) > 2 else '.')
