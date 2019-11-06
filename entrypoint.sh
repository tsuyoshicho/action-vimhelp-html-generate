#!/bin/sh

if [ -z "${FOLDER}" ]
then
  echo "You must provide the action with the folder name in the repository where your work."
  exit 1
fi

# File Deploy
rm -rf ${FOLDER}/
cp -r doc ${FOLDER}
cd ${FOLDER}/; vim -eu /tools/buildhtml.vim -c "qall!"; cd -
find ${FOLDER}/ \( -name "*.txt" -or -name "*.??x" \) -type f -print0 | rm -f {} \;
cd ${FOLDER};sh /tools/genindex.sh > index.html; cd -

# EOF
