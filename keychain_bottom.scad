/*
 Keychain Bottom

 This file defines the bottom plate of the keychain.  This side will receive a socket head screw.
 The screw head should fit flush or deeper than the top surface of the plate.

 @author Kenneth Barbour
 @copyright 2014
 */
include <lib.scad>;

keychainWidth = 25;
keychainLength = 100;

screwHoleDiameter = 3.5;
screwHeadDiameter = 7.5;
screwHeadThickness = 3.5;
baseThickness = 2;
filletRadius = 4;

difference() {
	keychain_blank(size=[keychainWidth, keychainLength, screwHeadThickness+baseThickness], r=filletRadius);
	translate([keychainWidth/2, keychainWidth/2,0])
		socket_screw_hole(screwHoleDiameter, baseThickness, screwHeadDiameter, screwHeadThickness);
	translate([keychainWidth/2, keychainLength - keychainWidth/2,0])
		socket_screw_hole(screwHoleDiameter, baseThickness, screwHeadDiameter, screwHeadThickness);
	translate([keychainWidth/2, keychainLength/2,0])
		socket_screw_hole(screwHoleDiameter, baseThickness, screwHeadDiameter, screwHeadThickness);
}