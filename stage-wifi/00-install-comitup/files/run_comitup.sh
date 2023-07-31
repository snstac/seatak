#!/bin/bash -e
#
# Startup file for comitup
#
# Copyright 2023 Sensors & Signals LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


AIRTAK_CONF="/boot/seatak-config.txt"
COMITUP_CONF="/boot/comitup.conf"

if [[ -f ${AIRTAK_CONF} ]]; then
  . ${AIRTAK_CONF}
fi

if [[ ! -f ${COMITUP_CONF} ]]; then
  echo "${COMITUP_CONF} doesn't exist, initializing."
  echo "# ap_name:" >> ${COMITUP_CONF}
fi

if ! grep -qs -e 'ap_name' ${COMITUP_CONF}; then
  echo "Adding empty ap_name to ${COMITUP_CONF}"
  echo "# ap_name:" >> ${COMITUP_CONF}
fi

if [ -z "$NODE_ID" ]; then
  echo "NODE_ID not set, will retry..."
  exit 1
fi


NEW_SSID="SeaTAK-${NODE_ID: -4}"
sed --follow-symlinks -i -E -e "s/# ap_name:.*/ap_name: $NEW_SSID/" ${COMITUP_CONF}
echo "comitup SSID is: $NEW_SSID"


/usr/sbin/comitup
