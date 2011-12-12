#!/bin/bash
SETTINGS="settings.conf"
source ./${SETTINGS}
# Print aliases for the streams in the settings file. These can be interpreted by the shell.
for r in $(grep -P "^RADIO" ${SETTINGS} | perl -pe 's/^RADIO([A-Z0-9]+)=.*/\1/'); do
	URL=$(grep -P "^RADIO${r}=" ${SETTINGS} | perl -pe 's/^RADIO(?:[A-Z0-9]+)=\"(.*)\"/\1/')
	LC=$(echo $r | tr '[:upper:]' '[:lower:]')
	echo "alias ${LC}=\"${PLAYER} ${URL}\""
done
