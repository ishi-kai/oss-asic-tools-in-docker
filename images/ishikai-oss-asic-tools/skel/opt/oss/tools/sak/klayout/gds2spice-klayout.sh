#!/bin/sh
# Copyright 2020 Efabless Corporation
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

# This script extract the netlist from a layout using Klayout

: ${1? "Usage: $0 The gds file that will be extracted"}

echo "converting $1 to spice netlist"

klayout -b -rd input=$1 \
    -r ${SAK}/klayout/tech/sky130A/sky130A.lylvs 
