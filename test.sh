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

  echo "Joe: If any line above does not begin with 'Joe:' there is a problem ..."
  echo "Joe: ...with the format of your submission, and it may get 0 marks."
  echo "Joe: Make sure you have added all the files you need to, and committed."
  echo "Joe: If your submission is ready to be marked, make sure it is tagged correctly."
  echo "Joe: Here are the files currently added (not necessarily committed!):"

  git ls-files

else
  echo "ERROR: The file quadtree.hs does not exist!"
  echo "ERROR: Check your filenames!"
fi

