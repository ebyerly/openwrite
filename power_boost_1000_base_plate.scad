use <generic_base_plate.scad>

// ----- General notes
// width = x axis
// depth = y axis
// height = z axis
// All measures in millimeters

module powerboost_1000_base(
    // thickness of base plate
    plate_thickness = 3,
    // mounting point height above plate
    mount_post_height = 2,
) {
    // Powerboost 1000 measurements
    pb_base_width = 36.2;
    pb_base_depth = 22.86;
    pb_base_fillet_radius = 2.5;
    pb_screw_size = 2.5;

    // Screw hole centers are consistently offset from the x and y edges.
    pb_screw_hole_offset = 2.605;
    // Mounting point centers expressed as [x,y]
    pb_mount_post_centers = [
        // bottom left x,y
        [
            pb_screw_hole_offset,
            pb_screw_hole_offset
        ],
        // top left x,y
        [

            pb_screw_hole_offset,
            pb_base_depth - pb_screw_hole_offset
        ]
    ];

    generic_base_plate(
        base_width = pb_base_width,
        base_depth = pb_base_depth,
        mount_post_centers = pb_mount_post_centers,
        base_fillet_radius = pb_base_fillet_radius,
        plate_thickness = plate_thickness,
        mount_post_height = mount_post_height,
        metric_screw = pb_screw_size
    );
}

$fa = 1;
$fs = 0.25;
powerboost_1000_base();