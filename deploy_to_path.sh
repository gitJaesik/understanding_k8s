#!/bin/bash

tmp_path=/PV/path/tmp
if [ -d ${tmp_path} ]; then
  rm -rf ${tmp_path}
fi

# jfrog 설정이 필요함
if [ "${MOVELVERSION}" = "" ]; then
  mkdir -p ${tmp_path}
  jfrog rt dl "artifactory" tmp_path --sort-by=created --sort-order=desc --limit=1 --flat

  MODELFILE=$(ls ${tmp_path})
  MODELFILEVERSION=$(ls ${tmp_path} | cut -d "-" -f 2 | cut -d "." -f 1,2,3)
  # file 이동
fi

