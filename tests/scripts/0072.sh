#!/bin/bash
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
# Copyright (C) 2019 Western Digital Corporation or its affiliates.
#

. scripts/test_lib

if [ $# == 0 ]; then
	echo "Conventional file unlink"
        exit 0
fi

if [ "$nr_cnv_files" == 0 ]; then
	exit_skip
fi

echo "Check conventional file unlink"

zonefs_mkfs "$1"
zonefs_mount "$1"

rm -f "$zonefs_mntdir"/cnv/0 && \
    exit_failed " --> SUCCESS (should FAIL)"

zonefs_umount

exit 0
