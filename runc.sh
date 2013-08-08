#!/bin/bash

TMPFILE=`mktemp '/tmp/runc.XXXXXXXXX'`

mv $TMPFILE "$TMPFILE.c"
TMPFILE="$TMPFILE.c"

echo "#include <stdio.h>" > $TMPFILE
echo "int main( int argc, char *argv[] ) {" >> $TMPFILE

while read -r line
do 
	echo -n "$line" >> $TMPFILE; 
done

echo "}" >> $TMPFILE;

gcc -o /tmp/runc $TMPFILE
rm $TMPFILE
/tmp/runc
