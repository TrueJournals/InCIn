#!/bin/bash

echo "Welcome to IncIn, an inline interpreter for c";
CODE=""
TEMP_FILE=$(mktemp --tmpdir IncIn.XXXXXXXXXX)
chmod +x $TEMP_FILE
while true; do
	read -p ">>> " temp
	CODE="$CODE $temp" #Append old code to new

    gcc -x c -o $TEMP_FILE - <<EOF
    #include <stdio.h>
    int main(int argc, char** argv) {
        $CODE
    return 0;
    }
EOF
    
	#run
	$TEMP_FILE
	
	echo
done
rm $TEMP_FILE

