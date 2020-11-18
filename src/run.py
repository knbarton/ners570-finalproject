#!/usr/bin/env python

"""
This script will run the entire model and it will perform the
post-processing of data
"""

import subprocess

subprocess.run(['model/tsunami'])
subprocess.run(['processing/plot.py'])
