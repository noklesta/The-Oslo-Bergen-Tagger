#!/bin/sh

if [ $# -ne 1 ]
then
  echo "Usage: `basename $0` TEXTFILE"
  exit $E_BADARGS
fi

bin/mtag -wxml < $1 | vislcg3 -C latin1 --codepage-input \
  utf-8 -g cg/bm_morf.cg --codepage-output utf-8 --no-pass-origin -e | \
  perl -ne 'print if /\S/'
