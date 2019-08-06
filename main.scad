rpeg = 1.8; // radius of peg. Also used for almost everything else.

module base(sep = 1, width = 1, dist = 1, thickness = rpeg * 2, rounded = false)
{
	w = width - 1;

	for(i = [0:dist:w])
		translate([0, (i * 12) + rpeg, rpeg]) rotate([90, 0]) pegs(sep);
	//backplate
	if(rounded == false)
		cube([thickness, (rpeg * 2) + (w * 12), sep * 12 + rpeg * 2]);
	else
	{
		cube([thickness / 2, (rpeg * 2) + (w * 12), sep * 12 + rpeg * 2]);
		translate([thickness / 2, thickness / 2]) cube([thickness / 2, (rpeg * 2) + (w * 12) - thickness, sep * 12 + rpeg * 2]);
		translate([thickness / 2, thickness / 2]) cylinder(sep * 12 + rpeg * 2, thickness / 2, thickness / 2);
		translate([thickness / 2, (rpeg * 2) + (w * 12) - thickness / 2]) cylinder(sep * 12 + rpeg * 2, thickness / 2, thickness / 2);
	}
}

module pegs(sep)
{
	s = sep * 12;
	depth = 1.5;
	r = rpeg;

	rotate([0, -90])
	{
		cylinder(depth - 1 + (r * 2), r, r);
		translate([0, 0, depth - 1 + (r * 2)]) cylinder(1, r, r - 1);
		translate([0, s]) cylinder(depth, r, r);
	}
	translate([-depth, s + r]) rotate_extrude(angle=90) translate([-r, 0]) circle(r);
	translate([-depth - r, s + r]) rotate([-90]) cylinder(2, r, r);
	translate([-depth - r, s + r + 2]) rotate([-90, 0]) cylinder(1, r, r - 1);
}

//base(1, 3, 1, rounded = false);
