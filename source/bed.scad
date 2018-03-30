
use <zcube.scad>;
use <bolts.scad>;

vertical_space = 700;
side_thickness = 25;
side_height = 200;

module bed(width = 1000, length = 2000, height=2000, mattress_thickness=100) {
	extension = (side_thickness + 50) * 2;
	
	//futon
	//translate([0, 0, height-side_height+75]) color("black") zcube([width, length, mattress_thickness]);
	
	color("brown") {
		translate([-width/2, 0, height-side_height]) zcube([side_thickness, length, 50], x=1, bom="slat rails");
		translate([width/2, 0, height-side_height]) zcube([side_thickness, length, 50], x=-1, bom="slat rails");
	
		for (i = [-length/2:200:length/2]) {
			translate([0, i, height-side_height+50]) zcube([width, 50, 25], bom="slat");
		}
	}
	
	color("red") {
		translate([-width/2, 0, height-side_height]) zcube([side_thickness, length+extension, side_height], x=-1, bom="sides");
		translate([width/2, 0, height-side_height]) zcube([side_thickness, length+extension, side_height], x=1, bom="sides");
		translate([0, -length/2, height-side_height]) zcube([width, side_thickness, side_height], y=-1, bom="sides");
		translate([0, length/2, height-side_height]) zcube([width, side_thickness, side_height], y=1, bom="sides");
	}
	
	color("orange") {
		zcorners() {
			translate([width/2-side_thickness*2, length/2+side_thickness, 0]) zcube([50, 50, height], x=1, y=1, bom="posts");
		}
	}
}

rotate([0, 0, 0]) {
	translate([-500, 0, 0]) bed(height=side_height*3+vertical_space*2);
	rotate([0, 0, 90]) translate([-500, 0, 0]) bed(height=side_height*2+vertical_space);
	bed(width=2000, height=1000, height=side_height, mattress_thickness=150);
}

// house
module house(width = 2400, depth = 2400, height = 2100) {
	translate([-depth/2, 0, 0]) color("grey") zcube([1, width, height]);
	translate([-depth/2, 0, height]) color("grey") rotate([0, 45, 0]) zcube([1, width, 1000]);
	
	translate([-depth/2, -width/2, 0]) color("grey") zcube([depth, 1, height]);
	translate([-depth/2, -width/2, height]) color("grey") rotate([-45, 0, 0]) zcube([depth, 1, 1000]);
	
	translate([0, width/2, 0]) color("grey") zcube([depth, 1, height+710]);
	
	color("grey") zcube([depth, width, 1]);
};

//house();