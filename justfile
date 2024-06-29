# Finds all SVGs and converts them into PNGs in out/
# Also generates transparent padded outputs, suitable for profile pictures.
pngify:
  #!/bin/sh
  mkdir -p out/
  mogrify -background none -format png -path out */**.svg
  for i in out/*-transp.png; do
    convert "$i" -background none -gravity center -extent 650x650 "${i%.png}-padded.png"
  done

# Finds all SVGs and converts them into optimized SVGs in out/
export-inkscape:
  #!/bin/sh
  mkdir -p out/
  for i in */**.svg; do
    base=${i##*/}
    inkscape "$i" --export-plain-svg --export-type=svg --export-filename=- | scour -o out/"${base}"
  done

clean:
  rm -rf out

build: pngify export-inkscape
