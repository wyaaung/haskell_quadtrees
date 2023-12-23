#!/bin/bash

if [ -f quadtree.hs ]; then
    if grep -q "^main=" quadtree.hs ; then
   echo "Warning: quadtree.hs contains a definition of main"
   echo "Warning: attempting to recover..."
   echo "Warning: this may make the following test results misleading!"
   grep -vw "^main=" quadtree.hs > temp_file.hs
  else
   if grep -q "^main " quadtree.hs ; then
    echo "Warning: quadtree.hs contains a definition of main"
    echo "Warning: attempting to recover..."
    echo "Warning: this make make the following test results misleading!"
    grep -vw "^main " quadtree.hs > temp_file.hs
   else
    cat quadtree.hs > temp_file.hs
   fi
  fi


  if grep -q "^blur" quadtree.hs; then
    cat test_1.hs >> temp_file.hs
    cat test_2.hs >> temp_file.hs
    ghc -v0 temp_file.hs
    ./temp_file
    rm temp_file
   else
    echo "Warning: No implementation of blur detected, checking Test 1 only."
    cat test_1.hs >> temp_file.hs
    echo "main = mainS >> mainE" >> temp_file.hs
    ghc -v0 temp_file.hs
    ./temp_file
    rm temp_file
  fi

else
  echo "ERROR: The file quadtree.hs does not exist!"
  echo "ERROR: Check your filenames!"
fi

