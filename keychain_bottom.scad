/*
 Keychain Bottom

 This file defines the bottom plate of the keychain.  This side will receive a socket head screw.
 The screw head should fit flush or deeper than the top surface of the plate.

 @author Kenneth Barbour
 @copyright 2014
 */
include <lib.scad>;
include <measurements.scad>;

difference() {
	keychain_blank(size=[keychainWidth, keychainLength, screwHeadThickness+baseThickness], r=filletRadius);
	translate([keychainWidth/2, keychainWidth/2.5,0])
		socket_screw_hole(screwHoleDiameter, baseThickness, screwHeadDiameter, screwHeadThickness);
	translate([keychainWidth/2, keychainLength - keychainWidth/2.5,0])
		socket_screw_hole(screwHoleDiameter, baseThickness, screwHeadDiameter, screwHeadThickness);
	translate([keychainWidth/2, keychainLength/2,0])
		socket_screw_hole(screwHoleDiameter, baseThickness, screwHeadDiameter, screwHeadThickness);
}