include <main.scad> // base(), rpeg
length = 12;
nwidth = 1;
nheight = 1;

/* [Hidden] */
$fn = 36;

module hook()
{
	translate([-dpeg, 0, dpeg]) rotate([-90, 0]) base(nheight, nwidth, 1);

    w = 12 * (nwidth-1) + dpeg;
    h = 12 * (nheight-1);
    translate([0, h ,-w + dpeg]) {
        cube([length, dpeg, w]);
        translate([length, dpeg]) rotate_extrude(angle=-90) square([dpeg, w]);
        translate([length, dpeg]) cube([dpeg, dpeg, w]);
        translate([length + rpeg, dpeg * 2]) cylinder(w, rpeg, rpeg);
        
        // support
        if(nheight > 1) {
            slength = sqrt(pow(length, 2) + pow(h, 2));
            sangle = acos(length / slength);
            translate([0, -h, 0]) rotate([0,0,sangle]) cube([slength, dpeg, w]);
        }
    }   
}

hook();
