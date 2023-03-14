include <BOSL2/std.scad>

// module dimmer() {
//     // COLORS = ["red", "yellow", "blue", "purple", "green"]
//     color("yellow", 0.1) children();
// }

// dimmer() {
//     up(30)
//     left(60)
//     fwd(5)
//     rect([60,40], chamfer=10) show_anchors();
// }

// // color("yellow", 0.25) rect([60,40], chamfer=10) show_anchors();

// color("green", 0.25) cube([50,40,20], anchor=TOP+BACK);

// color("purple", 0.25) cuboid([60,25,60], rounding=10);


minkowski() {
    union() {
	cube([100,33,33], center=true);
	cube([33,100,33], center=true);
	cube([33,33,100], center=true);
    }
    sphere(r=8);
}