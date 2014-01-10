include <lib.scad>;
include <measurements.scad>;
$fn=26;
difference() {
	union() {
		keychain_blank(size=[keychainWidth, keychainLength, nutThickness+baseThickness], r=filletRadius);
		translate([keychainWidth/2, keychainWidth/2,0])
			rounded_cylinder(r1=keychainWidth/2, r2=filletRadius, h=baseThickness+nutThickness+fulcrumHeight);
	}

	// Main plate screw holes
	translate([keychainWidth/2, keychainWidth/2, 0])
		hex_nut_hole(screwHoleDiameter, baseThickness+nutThickness, nutDiameter, nutThickness);
	translate([keychainWidth/2, keychainLength - keychainWidth/2, 0])
		hex_nut_hole(screwHoleDiameter, baseThickness+nutThickness, nutDiameter, nutThickness);
	translate([keychainWidth/2, keychainLength/2, 0])
		hex_nut_hole(screwHoleDiameter, baseThickness+nutThickness, nutDiameter, nutThickness);

	// Clip channel
	translate([(keychainWidth-fulcrumSpacing)/2,0,baseThickness+nutThickness-.01]) 
		cube_fillet_bottom([fulcrumSpacing, keychainWidth, fulcrumHeight+.01], fulcrumFillet);

	// clip screw
	translate([keychainWidth/2, keychainWidth/2, clipScrewHeight]) rotate([0,90,0])
		hex_nut_hole(screwHoleDiameter, keychainWidth/2, nutDiameter, nutThickness+.5);
	translate([keychainWidth/2, keychainWidth/2, clipScrewHeight]) rotate([0,-90,0])
		socket_screw_hole(screwHoleDiameter, keychainWidth/2 - screwHeadThickness, screwHeadDiameter, screwHeadThickness);

	// Spring perch
	translate([keychainWidth/2,keychainWidth/6, baseThickness+nutThickness-springDepth]) cylinder(r=springDiameter/2, h=springDepth);
}