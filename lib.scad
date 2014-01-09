/**
 * Basic keychain shape; Consists of an oblong cylinder
 * that is rounded on the top edge.
 * @param size x,y,z matrix of the size of the keychain
 * @param r radius of top edge
 */
module keychain_blank(size=[10,50,5], r=2, $fn=16) {
	hull() {
		translate([size[0]*.5,size[0]*.5,0]) rounded_cylinder(r1=size[0]/2, r2=r, h=size[2], $fn=$fn);
		translate([size[0]*.5, (size[0]*-.5+size[1]), 0]) rounded_cylinder(r1=size[0]/2, r2=r, h=size[2], $fn=$fn);
	}
}

/**
 * Cylinder that is rounded on one end
 * @param r1 radius of cylinder
 * @param r2 radius applied to top edge
 * @param h overall height of cylinder
 */
module rounded_cylinder(r1, r2, h, $fn) {
	minkowski() {
		cylinder(r=r1-r2, h=.0001, $fn=$fn);
   	bullet(r=r2, h=h-.0001, $fn=$fn);
	}
}

/**
 * Simple bullet shape.
 * Consists of a cylinder with a hemisphere on top
 */
module bullet(r, h) {
	difference() {
		union() {
			cylinder(r=r, h=h-r);
			translate([0,0,h-r]) sphere(r=r);
   	}
			translate([0,0,-r]) cylinder(r=r, h=r);
		}
}
