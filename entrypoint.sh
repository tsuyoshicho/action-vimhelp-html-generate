#!/bin/sh

if [ -z "${FOLDER}" ]
then
  echo "You must provide the action with the folder name in the repository where your work."
  exit 1
fi

# File Deploy
rm -rf ${FOLDER}/
cp -r doc ${FOLDER}
cd ${FOLDER}/; vim -i NONE --not-a-term -e -s -N -X -V1 -u /tools/buildhtml.vim -c "qall!"; cd -
find ${FOLDER}/ \( -name "*.txt" -or -name "*.??x" \) -type f -exec rm -f {} +
rm -f ${FOLDER}/tags
rm -f ${FOLDER}/tags-??
cd ${FOLDER};sh /tools/genindex.sh > index.html; cd -
touch "${FOLDER}/.nojekyll"

# EOF
