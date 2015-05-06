#!/bin/sh

if [ $# -ne 1 ]
then
  echo "Usage: `basename $0` TEXTFILE"
  exit $E_BADARGS
fi

OBT=$(dirname $0)

"$OBT"/bin/mtag -wxml < $1				\
    | vislcg3 --codepage-all latin1			\
	      --codepage-input utf-8			\
	      --grammar "$OBT"/cg/bm_morf-prestat.cg	\
	      --codepage-output utf-8			\
	      --no-pass-origin				\
	      --show-end-tags				\
    | "$OBT"/OBT-Stat/bin/run_obt_stat.rb		\
    | perl -ne 'print if /\S/'
