#! /bin/bash
shopt -s nullglob
rm *-m.*
for f in *.gif *.jpg *.png
do
  # name=${f%%.*} # a.b.c.d -> .b .b.c .b.c.d
  # ext=${f#*.}
  # new=jpg-$name.jpg
  # sips -g pixelWidth -g pixelHeight $new
  # sips --resampleWidth 640 $f -o $new
  sips --resampleWidth 1024 $f -o medium-$f
  # sips -s format jpeg medium-$f -o $new
  # sips -g pixelWidth -g pixelHeight $new
done