#!/bin/bash

if [[ ! -f "r0_input.txt" ]]; then
  echo "r0_input.txt not found!"
  exit 1
fi

# Process the r0 input file and split the contents
# if a comma exists in the line, then split the contents
# into numbered list 1.(before comma, after "* ") and 2.(after comma)
awk '{
    if (match($0, /,/)) {
        split($0, a, /, /);
        gsub(/^\* /, "", a[1]);
        print "1. " a[1];
        print "2. " a[2] "\n";
    } else {
        print $0;
    }
}' r0_input.txt > r0_output.txt

# Process the r1 input file and split the contents
# if "I am" exists AND "My favorite sandwich is" exists
# then split the contents into numbered list 1.(after "I am" before ".")
# and 2.(after "My favorite sandwich is" before ".")
awk '{
    if (match($0, /I am/) && match($0, /My favorite sandwich is/)) {
        split($0, a, /I am |My favorite sandwich is /);
        gsub(/\./, "", a[2]);
        gsub(/\./, "", a[3]);
        print "1. " a[2];
        print "2. " a[3] "\n";
    }
}' r1_input.txt > r1_output.txt

# Process the r2 input file and split the contents
# if "sandwich with" exists AND ("for here" exists OR "to go" exists)
# then split the contents into numbered list 1.(after "sandwich with" before " ")
# and 2.either "for here" or "to go"
awk '{
    if (match($0, /sandwich with/) && (match($0, /for here/) || match($0, /to go/))) {
        split($0, a, /sandwich with | for here| to go/);
        print "1. " a[2];
        if (match($0, /for here/)) {
            print "2. for here \n";
        } else if (match($0, /to go/)) {
            print "2. to go \n";
        }
    } else {
        print $0;
    }
}' r2_input.txt > r2_output.txt