#!/bin/bash

pythonver=$1
if [ -z "$pythonver" ]; then
   pythonver="2.7.2"
fi

qtver=$2
if [ -z "$qtver" ]; then
qtver="4.7.4"
fi

pythondir=$PWD/$pythonver
if [ ! -d "$pythondir" ]; then
   echo "Error: No python '$pythondir' founded."
   exit 1
fi

qt=`dirname $PWD`/qt/$qtver

export PATH=$pythondir/bin:$qt/bin:$PATH
echo "PATH=$PATH"

if [[ "$pythonver" > "3" ]]; then
   python="python3"
else
   python="python"
fi

cd PyQt-x11-gpl-4.8.5

flags="-g --confirm-license"
flags="$flags -e QtCore -e QtGui -e QtSvg"

if [ ! -z "$3" ]; then
   $python configure.py -h
else
   $python configure.py $flags
   make
   make install
fi
