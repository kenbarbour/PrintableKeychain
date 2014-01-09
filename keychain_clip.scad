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

clipWidth = fulcrumSpacing-2;
clipLength = keychainLength*.9;
clipThickness = screwHoleDiameter + 2*1;
clipRadius = 2;

$fn = 32;

translate([clipWidth,0,clipThickness]) rotate([0,180,0]) 
	cube_fillet_bottom([clipWidth, clipLength - clipWidth/2, clipThickness], clipRadius);
translate([clipWidth/2, clipLength-clipWidth/2, 0])
	rounded_cylinder(r1=clipWidth/2, r2=clipRadius, h=clipThickness);