#!/bin/sh

if [ $# -ne 1 ]
then
  echo "Usage: `basename $0` TEXTFILE"
  exit $E_BADARGS
fi

OBT=$(dirname $0)

"$OBT"/bin/mtag -wxml -nn < $1			\
    | vislcg3 --codepage-all latin1		\
	      --codepage-input utf-8		\
	      --grammar "$OBT"/cg/nn_morf.cg	\
	      --codepage-output utf-8		\
	      --no-pass-origin			\
	      --show-end-tags			\
   | perl -ne 'print if /\S/'
