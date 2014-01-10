FN=26
DFLAGS = '$$fn=$(FN)'

all: keychain_bottom.stl keychain_top.stl keychain_clip.stl

keychain_top.stl: keychain_top.scad lib.scad measurements.scad
	openscad -o keychain_top.stl -D $(DFLAGS) keychain_top.scad

keychain_bottom.stl: keychain_bottom.scad lib.scad measurements.scad
	openscad -o keychain_bottom.stl -D $(DFLAGS) keychain_bottom.scad

keychain_clip.stl: keychain_clip.scad lib.scad measurements.scad
	openscad -o keychain_clip.stl -D $(DFLAGS) keychain_clip.scad

clean:
	rm *.stl
