#!/bin/bash

dir_tmp=/tmp/extensions
latest_xpi=$1
url_addons_downloads=https://addons.mozilla.org/firefox/downloads

mkdir -p ${dir_tmp}

echo "Downloading extension ${url_addons_downloads}/${latest_xpi}..."
wget ${url_addons_downloads}/${latest_xpi}

echo "Unzipping extension ${latest_xpi}..."
mv *.xpi ${dir_tmp}
cd ${dir_tmp}
unzip ${dir_tmp}/*.xpi
extension_id=$( grep -m 1 em:id ${dir_tmp}/install.rdf | cut -f2 -d'>' | cut -f1 -d'<' )
dir_extension=/usr/share/mozilla/extensions/${extension_id}

rm -f ${dir_tmp}/*.xpi

echo "Installing extension in ${dir_extension}..." 
mkdir -p ${dir_extension}
mv -f ${dir_tmp}/* ${dir_extension}
