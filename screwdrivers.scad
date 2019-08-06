include <main.scad>
rtool   = 7;
rmax    = 14;
ntool   = 4;

/* [Hidden] */
$fn     = 36;
h       = 12 + rpeg * 2;
spacing = rmax * 3;
width   = ntool * spacing - rmax;
nwidth  = round(width / 12 + 1.5);

echo(width, nwidth);

difference()
{
	base(1, nwidth, 2, (rmax * 2) + (rpeg * 2), rounded = true);
	for(i = [0:ntool - 1]) translate([rmax + rpeg, (rmax + rpeg) + ((nwidth * 12 - width - 12) / 2) + (i * spacing)])
	{
		cylinder(h, rtool, rtool);
		translate([0, -rtool]) cube([rmax + rpeg + 1, rtool * 2, h]);
		translate([0, 0, h / 2]) cylinder(h, rmax, rmax);
	}
}
