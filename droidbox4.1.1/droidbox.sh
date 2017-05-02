#!/bin/bash

if [ $(which monkeyrunner | wc -l) -eq 0 ]; then
    echo "monkeyrunner not found in PATH"
    exit 1;
fi

if [ $# -lt 1 ] || [ $# -gt 2 ];then
	echo "Usage: $0 APK <duration in seconds>"
	exit 1;
fi

python "scripts/droidbox.py" $1 $2
