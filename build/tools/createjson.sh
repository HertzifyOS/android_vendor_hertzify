#!/bin/bash
#
# Copyright (C) 2026 HertzifyOS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# $1=TARGET_DEVICE, $2=PRODUCT_OUT, $3=FILE_NAME

existingOTAdevices=./OTA/devices/hertzify.devices
output="$2/$1.json"

# cleanup old file
if [ -f "$output" ]; then
    rm "$output"
fi

echo "Generating JSON file data for OTA support..."

buildprop="$2/system/build.prop"
linenr=`grep -n "ro.build.date.utc" "$buildprop" | cut -d':' -f1`
datetime=`sed -n $linenr'p' < "$buildprop" | cut -d'=' -f2`
filename="$3"
id=`sha256sum "$2/$3" | cut -d' ' -f1`
size=`stat -c "%s" "$2/$3"`
version=`echo "$3" | cut -d'-' -f2`

if [ -f "$existingOTAdevices" ] && grep -qx "$1" "$existingOTAdevices"; then
    romtype=OFFICIAL
else
    romtype=UNOFFICIAL
    echo 'There is no official support for this device yet'
fi

echo '{
    "response": [
        {
            "datetime": '$datetime',
            "filename": "'$filename'",
            "id": "'$id'",
            "romtype": "'$romtype'",
            "size": '$size',
            "url": "https://sourceforge.net/projects/hertzifyos/files/'$1'/'$3'/download",
            "version": "'$version'"
        }
    ]
}' >> "$output"

cat "$output"
echo ""
echo "JSON file created at: $output"
echo ""