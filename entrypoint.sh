#!/bin/sh

if [ -z "${FOLDER}" ]
then
  echo "You must provide the action with the folder name in the repository where your work."
  exit 1
fi

# File Deploy
rm -rf ${FOLDER}/
mkdir -p ${FOLDER}/generate
cp doc/* ${FOLDER}/generate
cd ${FOLDER}/generate; vim -eu /tools/buildhtml.vim -c "qall!"; cd -
cp ${FOLDER}/generate/*.html ${FOLDER}/
rm -rf ${FOLDER}/generate
cd ${FOLDER};sh /tools/genindex.sh > index.html; cd -

# EOF
