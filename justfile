# Finds all SVGs and converts them into PNGs in out/
# Also generates transparent padded outputs, suitable for profile pictures.
pngify:
  #!/bin/sh
  mkdir -p out/
  mogrify -background none -format png -path out */**.svg
  for i in out/*-transp.png; do
    convert "$i" -background none -gravity center -extent 800x800 "${i%.png}-padded.png"
  done

clean:
  rm -rf out

build pngify:

