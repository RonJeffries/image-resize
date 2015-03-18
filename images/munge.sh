#! /bin/bash
shopt -s nullglob
rm *-m.*
for f in *.gif *.jpg *.png
do
  name=${f%%.*}
  ext=${f#*.}
  new=$name-m.$ext
#  sips -g pixelWidth -g pixelHeight $new
  sips --resampleWidth 640 $f -o $new
#  sips -g pixelWidth -g pixelHeight $new
done