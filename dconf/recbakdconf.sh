#!/usr/bin/env bash
#
# Recover the dconf settings from an ini file.

dconf load / <<< "$(cat ./dconf-settings.ini)"
