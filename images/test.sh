#! /bin/bash
f=$1
echo $f
echo filename to first dot ${f%%.*} # .* matches TRAILING dot anything 
              # (so in abc.def.ghi matches .def.ghi and .ghi)
              # and %% returns the original with the LONGEST match deleted i.e. abc
echo filename to last dot ${f%.*}  # matches .def.ghi and .ghi deletes SHORTEST match, .ghi
echo ${f#*.}  # *. matches LEADING anything dot (so abc. abc.def.) deletes shortest match 
              # i.e. def.ghi
echo ${f##*.} # matches LEADING anything dot (abc. abc.def.) deletes LONGEST
              # i.e. ghi