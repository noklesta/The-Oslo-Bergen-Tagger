Installation and usage
=====================

The Oslo-Bergen Tagger consists of 3 parts:

* A multitagger
* A Constraint Grammar tagger
* A statistical tagger (so far only for bokm&aring;l)

The multitagger
---------------

The multitagger is currently only distributed in binary form (source code will
be available soon). A binary compiled on 64-bit RedHat Enterprise Linux 5
can be downloaded from our server at the Text Laboratory, University of Oslo
(<http://www.tekstlab.uio.no/mtag/linux64/mtag>). The file should be placed in 
the bin directory. For example:

	$ cd bin
	$ wget http://www.tekstlab.uio.no/mtag/linux64/mtag


The Constraint Grammar tagger
-----------------------------

1. Checkout the VISL CG-3 repository from the Subversion repository at the University of Southern Denmark, and install:

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

2. CG rules for morphological disambiguation of bokm&aring;l are found in the `cg` folder.


The statistical tagger
----------------------

1. Clone the OBT-Stat git repository from GitHub:

		$ git clone git://github.com/andrely/OBT-Stat.git

2. Download the HunPos distribution for your operating system and unpack it 
inside the `OBT-Stat/hunpos` folder (producing a folder called, e.g., 
`OBT-Stat/hunpos/unpos-1.0-linux`). HunPos can be downloaded from here: 
<http://code.google.com/p/hunpos/downloads/list>


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

