include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/metric_screws.scad>

// ----- General notes
// width / left and right = x axis
// depth / front and back = y axis
// height / down and up = z axis
// All measures in millimeters

module generic_base_plate(
    plate_width = 10,
    plate_depth = 10,
    plate_height = 3,
    plate_fillet_radius = 0,
    mount_post_centers = [],
    metric_screw = 2.5, // metric screw type (e.g. M2.5 -> 2.5)
    mount_post_height = 2,
) {
    // Build the base plate with screw mounting points
    difference() {
        union() {
            // Base plate
            cuboid(
                [plate_width, plate_depth, plate_height],
                fillet = plate_fillet_radius,
                edges = EDGE_BK_RT + EDGE_BK_LF + EDGE_FR_LF + EDGE_FR_RT,
                p1 = [0, 0, 0]
            );
            // Screw mounting points
            for (post = mount_post_centers) {
                translate([post[0], post[1], plate_height]) {
                    cylinder(h = mount_post_height, r = metric_screw);
                }
            }
        }
        // Remove material from the base plate and mounting points equivalent to
        // the screws.
        for (post = mount_post_centers) {
            translate([post[0], post[1], plate_height + mount_post_height]) {
                metric_bolt(
                    size = metric_screw,
                    l = plate_height + mount_post_height + 0.1,
                    pitch = get_metric_iso_coarse_thread_pitch(metric_screw)
                );
            }
        }
    }
}

$fa = 1;
$fs = 0.25;
generic_base_plate(
    plate_width = 60,
    plate_depth = 40,
    mount_post_centers = [[5, 5], [20, 30]],
    plate_fillet_radius = 3,
    metric_screw = 4,
    plate_height = 4,
    mount_post_height = 1
);
