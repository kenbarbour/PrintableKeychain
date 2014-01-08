all: keychain_top.stl keychain_bottom.stl keychain_clip.stl

keychain_top.stl: keychain_top.scad lib.scad
	openscad -o keychain_top.stl keychain_top.scad

keychain_bottom.stl: keychain_bottom.scad lib.scad
	openscad -o keychain_bottom.stl keychain_bottom.scad

keychain_clip.stl: keychain_clip.scad lib.scad
	openscad -o keychain_clip.stl keychain_clip.scad
