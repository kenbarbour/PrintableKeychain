include <lib.scad>;

keychainWidth = 25;
keychainLength = 100;

nutThickness = 2.8;
nutDiameter = 7;
screwHoleDiameter = 3.5;
screwHeadDiameter = 7.5;
screwHeadThickness = 3.5;
baseThickness = 1.23;
filletRadius = 3;

fulcrumHeight = 6.5;
fulcrumSpacing = 12;
fulcrumFillet = 2;

springDiameter = 4;

clipScrewHeight = baseThickness + nutThickness + screwHoleDiameter/2;

//$fn = 32;

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
	translate([(keychainWidth-fulcrumSpacing)/2,0,baseThickness+nutThickness]) 
		cube_fillet_bottom([fulcrumSpacing, keychainWidth, fulcrumHeight], fulcrumFillet);

	// clip screw
	translate([keychainWidth/2, keychainWidth/2, clipScrewHeight]) rotate([0,90,0])
		hex_nut_hole(screwHoleDiameter, keychainWidth/2, nutDiameter, nutThickness+1.5);
	translate([keychainWidth/2+1.5, keychainWidth/2, clipScrewHeight]) rotate([0,-90,0])
		socket_screw_hole(screwHoleDiameter, keychainWidth/2 - screwHeadThickness, screwHeadDiameter+.5, screwHeadThickness+1.5);

	// Spring perch
	translate([keychainWidth/2,keychainWidth/6, baseThickness]) cylinder(r=springDiameter/2, h=nutThickness);
}