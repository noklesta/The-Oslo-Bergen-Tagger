Introduction
============

The Oslo-Bergen Tagger is a morphosyntactic tagger for Norwegian bokm&aring;l and nynorsk.
For general information about the tagger, visit its home page: <http://www.tekstlab.uio.no/obt-ny/>.

Using Docker
============
The easiest way to run the tagger is by using the Docker image found at https://hub.docker.com/r/noklesta/obt.
The following example pulls version 1.0 of the image from Docker Hub if necessary, mounts the host directory `/tekstlab` 
as `/texts` inside the Docker container and runs the `tag-bm.sh` command on the file `test.txt` in
that directory (see 'Running the tagger' below for the different ways to run the tagger):

    docker run -it --rm -v /tekstlab:/texts noklesta/obt:1.0 ./tag-bm.sh /texts/test.txt

Installation and usage
======================
If running the tagger as a Docker container is not an option, the tagger can be installed using the 
following instructions.

The tagger consists of three parts:

* A multitagger (tokenizer, morphological analyzer, and compund analyzer)
* A Constraint Grammar (CG) tagger
* A statistical tagger (currently only for bokm&aring;l)

The multitagger
---------------

The multitagger is written in Python and can be cloned from https://github.com/textlab/mtag:

    git clone git://github.com/textlab/mtag.git

The Constraint Grammar tagger
-----------------------------

1. Check out VISL CG-3 from the Github repository created by 
the University of Southern Denmark (<https://github.com/GrammarSoft/cg3>) and install it. The repository can be
checked out anywhere on your machine since it will be installed into a central
location such as `/usr/local/bin`. For some platforms, there are also ready-made
binaries available. Installation instructions for various 
platforms can be found at <http://beta.visl.sdu.dk/cg3/chunked/installation.html>.

2. CG rules for morphological disambiguation of bokm&aring;l and nynorsk are found in the `cg` folder.

	`bm_morf.cg` and `nn_morf.cg` should be used when you only want to do CG tagging of bokm&aring;l and nynorsk, respectively. 
The CG tagger may leave some ambiguity, either because it is not confident enough to do complete
disambiguation, or because there is genuine ambiguity in the material (such as nouns that can be analyzed as either
masculine or feminine).

	`bm_morf-prestat.cg` should be used when you want to run statistical disambiguation after CG disambiguation in order
to obtain completely disambiguated output (currently only available for bokm&aring;l). This is useful, for instance, 
for many language technology purposes. On the other hand, it may remove genuine ambiguity from the text.


The statistical tagger
----------------------

Clone the OBT-Stat git repository from GitHub in the root folder of the distribution:

    git clone git://github.com/textlab/OBT-Stat.git


Running the tagger
------------------

Shell scripts are included which will run the entire process: multitagging,
CG disambiguation, and optionally statistical disambiguation (for bokm&aring;l).

CG and statistical disambiguation, bokm&aring;l:

	./tag-bm.sh TEXTFILE > DISAMBIGUATED_OUTPUT_FILE

CG disambiguation only, bokm&aring;l:

	./tag-nostat-bm.sh TEXTFILE > DISAMBIGUATED_OUTPUT_FILE

CG disambiguation only, nynorsk:

	./tag-nostat-nn.sh TEXTFILE > DISAMBIGUATED_OUTPUT_FILE



Third-party software that uses the tagger
-----------------------------------------

[Clojure library by Aleksander Skj&aelig;veland Larsen](https://github.com/ogrim/clj-obt)  
[Python library by Mats Byrkjeland](https://github.com/draperunner/obt)

