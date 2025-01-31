#!/bin/bash
cd /mnt/work/lz/java_tests/KTU-Java
arr=( $( find . -maxdepth 2 -iregex '.+\.java' -type f ) )
#prepend=$(cat /mnt/work/lz/java_tests/OwnerDetails)
for file in "${arr[@]}";do
  #sed -i -e '/mnt/work/lz/java_tests/OwnerDetails.txt' "$file" 
  cat /mnt/work/lz/java_tests/OwnerDetails.txt $file > tmpFile;mv tmpFile $file
done
