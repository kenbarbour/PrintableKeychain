/**
 * Hole intended to make room for a socket head screw
 * @param diameter of screw shaft (bore)
 * @param length of screw (not including head)
 * @param diameter of socket head
 * @param head height
 */
module socket_screw_hole(diameter, height, headDiameter, headHeight) {
	union() {
		cylinder(r=diameter/2, h=height+headHeight);
		translate([0,0,height]) cylinder(r=headDiameter/2, h=headHeight);
	}
}

/**
 * Basic keychain shape; Consists of an oblong cylinder
 * that is rounded on the top edge.
 * @param size x,y,z matrix of the size of the keychain
 * @param r radius of top edge
 */
module keychain_blank(size=[10,50,5], r=2) {
	hull() {
		translate([size[0]*.5,size[0]*.5,0]) rounded_cylinder(r1=size[0]/2, r2=r, h=size[2]);
		translate([size[0]*.5, (size[0]*-.5+size[1]), 0]) rounded_cylinder(r1=size[0]/2, r2=r, h=size[2]);
	}
}

/**
 * Cylinder that is rounded on one end
 * @param r1 radius of cylinder
 * @param r2 radius applied to top edge
 * @param h overall height of cylinder
 */
module rounded_cylinder(r1, r2, h) {
	fragments = max(ceil($fn/4),3);
	union() {
		cylinder(r=r1, h=h-r2);
		for (i = [0 : fragments]) {
		translate([0,0,h-r2+(r2/fragments*i)])
			cylinder(
					r1=r1-r2 + sqrt(pow(r2,2)-pow(r2/fragments*i,2)),
					r2=r1-r2 + sqrt(pow(r2,2)-pow(r2/fragments*(i+1),2)),
					h=r2/fragments
				);
		}
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

/**
 * A cube with a fillet along the y axis, similar to a boat hull
 * @param size matrix
 * @param fillet radius
 */
module cube_fillet_bottom(size=[1,1,1], fillet) {
	union() {
		translate([size[0]/2, 0, fillet]) rotate([-90,0,0]) {
			translate([size[0]/2-fillet, 0, 0]) cylinder(r=fillet, h=size[1]);
			translate([size[0]/-2+fillet, 0, 0]) cylinder(r=fillet, h=size[1]);
		}
		translate([fillet,0,0]) cube([size[0]-fillet-fillet, size[1], fillet], center=false);
		translate([0,0,fillet]) cube([size[0], size[1], size[2]-fillet]);
	}
}

/**
 * A hole to insert a hex nut with a predrilled hole
 * @param holeDiameter diameter of hole to insert screw
 * @param height overall height of the hole (including any nut thickness)
 * @param nutDiameter diameter (corner to corner) of the nut
 */
module hex_nut_hole(holeDiameter, height, nutDiameter, nutThickness) {
	union() {
		cylinder(r=holeDiameter/2, h=height);
		translate([0,0,height-nutThickness]) cylinder(r1=nutDiameter/2, r2=nutDiameter/2+.25, h=nutThickness, $fn=6);
	}
}