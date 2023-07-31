#!/bin/bash -e
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

python3 -m pip install lincot==1.0.2b3

systemctl enable lincot
systemctl enable set_uuid

systemctl set-default multi-user

systemctl enable NetworkManager-dispatcher

sed --follow-symlinks -i -E -e "s/blank.org/seatak.local/" /usr/share/comitup/web/templates/connect.html
