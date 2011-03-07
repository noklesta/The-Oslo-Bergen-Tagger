Introduction
=====================

The Oslo-Bergen Tagger is a morphosyntactic tagger for Norwegian bokm&aring;l and nynorsk.
For general information about the tagger, visit its home page: <http://www.tekstlab.uio.no/obt-ny/>.

Installation and usage
======================
The tagger consists of three parts:

* A multitagger (tokenizer, morphological analyzer, and compund analyzer)
* A Constraint Grammar (CG) tagger
* A statistical tagger (currently only for bokm&aring;l)

The multitagger
---------------

The multitagger is currently only distributed in binary form (source code will
be available soon). A binary compiled on 64-bit RedHat Enterprise Linux 5
can be downloaded from our server at the Text Laboratory, University of Oslo
(<http://www.tekstlab.uio.no/mtag/linux64/mtag>). The file should be placed in 
the `bin` directory. For example:

	$ cd bin
	$ wget http://www.tekstlab.uio.no/mtag/linux64/mtag


The Constraint Grammar tagger
-----------------------------

1. Check out the VISL CG-3 repository from the Subversion repository at 
the University of Southern Denmark and install it. The repository can be
checked out anywhere on your machine since it will be installed into a central
location such as `/usr/local/bin`.

		$ svn co --username anonymous --password anonymous
		    http://beta.visl.sdu.dk/svn/visl/tools/vislcg3/trunk vislcg3
		$ cd vislcg3/
		$ ./autogen.sh
		$ make
		$ ./test/runall.pl
		... and if all tests succeed ...
		$ make install

	If you encounter any problems, have a look at the installation instructions at
	<http://beta.visl.sdu.dk/cg3/chunked/installation.html>

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

1. Clone the OBT-Stat git repository from GitHub in the root folder of the distribution:

		$ git clone git://github.com/andrely/OBT-Stat.git

2. Download the HunPos distribution for your operating system and unpack it 
inside the `OBT-Stat/hunpos` folder (producing a folder called, e.g., 
`OBT-Stat/hunpos/hunpos-1.0-linux`). HunPos can be downloaded from
<http://code.google.com/p/hunpos/downloads/list>. For example:

		$ cd OBT-Stat/hunpos
		$ wget http://hunpos.googlecode.com/files/hunpos-1.0-linux.tgz
		$ tar xvzf hunpos-1.0-linux.tgz 


Running the tagger
------------------

Shell scripts are included which will run the entire process: multitagging,
CG disambiguation, and optionally statistical disambiguation (for bokm&aring;l).

CG and statistical disambiguation, bokm&aring;l:

	$ ./tag-bm.sh TEXTFILE > DISAMBIGUATED_OUTPUT_FILE

CG disambiguation only, bokm&aring;l:

	$ ./tag-nostat-bm.sh TEXTFILE > DISAMBIGUATED_OUTPUT_FILE

CG disambiguation only, nynorsk:

	$ ./tag-nostat-nn.sh TEXTFILE > DISAMBIGUATED_OUTPUT_FILE

