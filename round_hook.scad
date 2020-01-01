include <main.scad> // base(), rpeg
length = 12;

/* [Hidden] */
$fn = 36;

module round_hook()
{
	translate([-dpeg, 0, dpeg]) rotate([-90, 0]) base(1, 1, 1);    
    translate([0, 0 , 0]) {
        translate([0, rpeg, rpeg]) rotate([0,90,0]) cylinder(r=rpeg, h=length);
        
        rd = 10;
        translate([length, rd+rpeg,rpeg])
        rotate([0, 0, 90])
        rotate_extrude(angle=35) 
        translate([-rd,0,0])
            circle(r=rpeg);
    }
}

round_hook();
