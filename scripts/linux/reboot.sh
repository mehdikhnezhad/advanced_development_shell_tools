#!/bin/bash
#
# Copyright 2015-2018 Adrian DC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Usage: reboot.sh (Crontab script to reboot when not building)

# Handle username
if [ ! -z "${1}" ]; then
  echo 'Loading .bashrc';
  source "/home/${1}/.bashrc";
fi;

# Build in progress
cd "${ANDROID_DEV_DRIVE}/Logs";
if [ ! -z "$(find ./* -mtime -0,003 | tail -1)" ]; then
  exit;
fi;

# Reboot
/sbin/shutdown -r now;