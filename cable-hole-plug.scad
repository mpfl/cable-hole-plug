hole_diameter = 50;
bezel = 5;
thickness = 2;
depth = 10;
cutout = 7.5;

$fn = 360;

difference() {
    union() {
        cylinder(d = hole_diameter + bezel, h = thickness);
        translate([0,0,thickness]) {
            difference() {
                cylinder(d = hole_diameter, h = depth);
                translate([0,0,0-depth/2])
                    cylinder(d = hole_diameter - 2 * thickness, h = depth * 2);
            }
        }
    }
    union() {
        translate([hole_diameter/2 - cutout/2,0,0-thickness/2]) {
            linear_extrude(thickness * 2 + depth)
                hull() {
                    circle(d = cutout);
                    translate([cutout,0,0])
                        circle(d = cutout);
                }
        }
    }
}