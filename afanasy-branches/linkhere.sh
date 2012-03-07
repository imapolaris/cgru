#!/bin/bash

src=$1

# Folders to link:
folders="doc icons plugins python src webvisor"

# Removing links and exit if no argumets provided:
if [ -z $src ]; then
   echo "Removing links..."
   for folder in $folders
   do
      [ -d "${folder}" ] && rm -fv $folder
   done
   echo "Done"
   echo "To make lings run:'$0 [branch]'"
   exit 0
fi

# Linking folders:
for folder in $folders
do
   ln -svf $src/$folder $folder
done