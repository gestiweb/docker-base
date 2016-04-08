#!/bin/bash
echo "WARN: Requires root or sudo to run."
echo "WARN: Requires debootstrap to run."
/usr/share/docker-engine/contrib/mkimage.sh -t gestiweb/base:debian-jessie debootstrap --variant=minbase jessie
