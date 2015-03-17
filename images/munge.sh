#! /bin/bash
for f in *.png 
do
  name=${f%%.*}
  ext=${f#*.}
  new=$name-m.$ext
  echo "cp $f $new"
  cp $f $new
  sips -g pixelWidth -g pixelHeight $new
  sips --resampleWidth 640 $new
  sips -g pixelWidth -g pixelHeight $new
done