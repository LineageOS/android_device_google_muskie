#!/bin/bash
#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

VENDOR=google
DEVICE=walleye

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

LINEAGE_ROOT="$MY_DIR"/../../..

HELPER="$LINEAGE_ROOT"/vendor/lineage/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

VENDOR_SKIP_FILES_WALLEYE=(
  "etc/selinux/vendor_file_contexts"
  "etc/selinux/nonplat_file_contexts"
  "etc/selinux/nonplat_hwservice_contexts"
  "etc/selinux/nonplat_mac_permissions.xml"
  "etc/selinux/nonplat_property_contexts"
  "etc/selinux/nonplat_seapp_contexts"
  "etc/selinux/nonplat_sepolicy.cil"
  "etc/selinux/nonplat_service_contexts"
  "etc/selinux/plat_sepolicy_vers.txt"
  "etc/selinux/precompiled_sepolicy"
  "etc/selinux/precompiled_sepolicy.plat_and_mapping.sha256"
  "etc/selinux/vndservice_contexts"
  "etc/selinux/plat_pub_versioned.cil"
  "etc/selinux/vendor_hwservice_contexts"
  "etc/selinux/vendor_mac_permissions.xml"
  "etc/selinux/vendor_property_contexts"
  "etc/selinux/vendor_seapp_contexts"
  "etc/selinux/vendor_sepolicy.cil"
)

generate_prop_list_from_image "$1" "$2" VENDOR_SKIP_FILES_WALLEYE
