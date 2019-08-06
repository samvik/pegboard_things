include <main.scad> // base(), rpeg
length = 12;

/* [Hidden] */
$fn         = 36;

module hook()
{
	translate([-rpeg * 2, 0, rpeg * 2]) rotate([-90, 0]) base(1, 1, 1);

	cube([length, rpeg * 2, rpeg * 2]);
	translate([length, rpeg * 2]) rotate_extrude(angle=-90) square(rpeg * 2);
	translate([length, rpeg * 2]) cube(rpeg * 2);
	translate([length + rpeg, rpeg * 4]) cylinder(rpeg * 2, rpeg, rpeg);
}

hook();
