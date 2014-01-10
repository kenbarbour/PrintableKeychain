include <lib.scad>;
include <measurements.scad>;

$fn = 24;

difference() {
	union() {
		translate([clipWidth,0,clipThickness]) rotate([0,180,0]) 
			cube_fillet_bottom([clipWidth, clipLength - clipWidth/2, clipThickness], clipRadius);
		translate([clipWidth/2, clipLength-clipWidth/2, 0])
			rounded_cylinder(r1=clipWidth/2, r2=clipRadius, h=clipThickness);
	}

	// Screw Hole
	translate([0, keychainWidth/2, clipThickness/2]) rotate([0,90,0])
		cylinder(r=screwHoleDiameter/2, h=fulcrumSpacing);

	// Spring perch
	translate([clipWidth/2,keychainWidth/6,-.001]) cylinder(r=springDiameter/2, h=springDepth);

	// Cut taper
	translate([0,0,clipThickness/.9]) rotate([-2,0,0])
		cube([clipWidth, keychainLength, clipThickness*2]);
}