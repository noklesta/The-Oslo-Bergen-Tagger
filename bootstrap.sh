#!/usr/bin/env bash

set -e

echo "Installing The Oslo Bergen Tagger. You might be asked for your password to install cg3"

# Download multitagger
if [ ! -f bin/mtag ]; then
    BASE_URL='http://www.tekstlab.uio.no/mtag'
    if [[ "$OSTYPE" == "darwin"* ]]; then
        wget "${BASE_URL}/osx64/mtag-osx64" -O obt/bin/mtag
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        wget "${BASE_URL}/linux64/mtag-linux-1-11" -O obt/bin/mtag
    else
        echo "Your platform $OSTYPE is not supported."
        exit 1
    fi
fi

# Make it executable
chmod +x bin/mtag

# Install VISL CG-3 (Constraint Grammar tagger)
if [[ "$OSTYPE" == "darwin"* ]]; then
    if ! brew ls --versions homebrew/science/vislcg3 > /dev/null; then
        brew install homebrew/science/vislcg3
    fi
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    if ! dpkg -s cg3 > /dev/null 2>&1; then
        sudo apt install cg3
    fi
else
    echo "You need to install cg3 manually. See http://beta.visl.sdu.dk/cg3/chunked/installation.html for instructions"
fi

# Clone obt-stat repo
if [ ! -d OBT-Stat ]; then
    git clone git://github.com/andrely/OBT-Stat.git obt/OBT-Stat
fi

echo "OK"
