include <main.scad> // base(), rpeg
length = 12;

/* [Hidden] */
$fn         = 36;

// Taken from https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/undersized_circular_objects
module cylinder_outer(height,radius,fn){
	fudge = 1/cos(180/fn);
	cylinder(h=height,r=radius*fudge,$fn=fn);}

module hook()
{
	rad = 6 + rpeg;
	fudge = 1/cos(22.5);

	translate([-rpeg * 2, 0]) base(1, 2, 1);

	translate([0, rad, rad]) rotate([90, 22.5, 90]) cylinder_outer(20, rad, 8);
	translate([20 + rad, rad, 12 + rpeg * 2]) rotate([0, 0, 22.5]) cylinder_outer(20, rad, 8);
	hull()
	{
		translate([20, rad, rad]) rotate([90, 22.5, 90]) cylinder(r = rad * fudge, $fn=8);
		translate([20 + rad, rad, 12 + (rpeg * 2)]) rotate([180, 0, 22.5]) cylinder(r = rad * fudge, $fn=8);
	}
	translate([20 + rad, rad, 32 + (rpeg * 2)]) rotate([0, 0, 22.5]) cylinder(rad / 2, rad * fudge, (rad / 2) * fudge, $fn=8);
}


rotate([90, 0]) hook();

