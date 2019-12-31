include <main.scad> // base(), rpeg
rring = 15/2;
dopen = 90; // Degrees open

/* [Hidden] */
$fn = 36;

module ring(open = 0)
{
    dpeg = rpeg*2.0;
    
	translate([-dpeg, 0, dpeg]) rotate([-90, 0]) base(1, 1, 1);

    rotate([-90,0,0])
    translate([rring, -rpeg, 0])
    difference() {
        cylinder(r=rring+dpeg, h=dpeg);
        translate([0,0,-0.1]) cylinder(r=rring, h=dpeg+0.2);
        
        rotate([0, 0, -dopen/2]) 
        rotate_extrude(angle=dopen, convexity = 10)
        translate([rring-0.1,-0.1,0]) square([dpeg+0.2, dpeg+0.2]);
        
    }
}

ring();
