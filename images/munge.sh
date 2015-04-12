#! /bin/bash
shopt -s nullglob
rm *-m.*
for f in *.gif *.jpg *.png
do
  # name=${f%%.*} # a.b.c.d -> .b .b.c .b.c.d
  # ext=${f#*.}
  # new=$name-m.$ext
#  sips -g pixelWidth -g pixelHeight $new
  # sips --resampleWidth 640 $f -o $new
  sips --resampleWidth 640 $f -o medium-$f
#  sips -g pixelWidth -g pixelHeight $new
done