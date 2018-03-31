
use <zcube.scad>;
use <bolts.scad>;

difference() {
	union() {
		hull() {
			cylinder(d=20, h=4);
			translate([25, 0, 0]) zcube([10,50,4], x=-1);
		}

		translate([25, 0, 0]) zcube([10,50,8], x=1);
	}
	
	hole(6);
}
