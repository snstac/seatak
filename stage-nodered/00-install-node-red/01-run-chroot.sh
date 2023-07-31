#!/bin/bash -e
# 
# Node-RED intaller and setup script for SeaTAK.
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

adduser --disabled-password --gecos 'Node-RED Service User' node-red || exit 0

# FIXME: I don't think this is required?
usermod -aG sudo node-red
# Let node-red see systemd logs:
usermod -aG adm node-red
# Let node-red get GPU stats:
usermod -aG video node-red
# Let node-red get SDR info:
usermod -aG plugdev node-red

# Install Node-RED using the node-red installer:
bash /usr/local/sbin/update-nodejs-and-nodered --confirm-install --nodered-user=node-red --confirm-root --no-init

# Install Node-RED pallet modules:
cd /home/node-red/.node-red
npm install node-red-contrib-tak
npm install node-red-contrib-web-worldmap
npm install node-red-dashboard
npm install node-red-node-ui-table

chown -R node-red:node-red /home/node-red

systemctl enable nodered
