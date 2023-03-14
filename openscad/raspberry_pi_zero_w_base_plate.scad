use <generic_base_plate.scad>

module raspberry_pi_zero_w_base(
    // thickness of base plate
    plate_height = 3,
    // mounting point height above plate
    mount_post_height = 2,
) {
    // https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#raspberry-pi-zero-w
    rpzw_width = 65.0;
    rpzw_depth  = 30.0;
    rpzw_fillet_radius = 3;
    rpzw_screw_size = 2.5;

    // Screw hole centers are consistently offset from the x and y edges.
    rpzw_screw_hole_offset = 3.5;
    // Mounting point centers expressed as [x,y]
    rpzw_mount_post_centers = [
        [
            rpzw_screw_hole_offset,
            rpzw_screw_hole_offset
        ],
        [
            rpzw_screw_hole_offset,
            rpzw_depth - rpzw_screw_hole_offset
        ],
        [
            rpzw_width - rpzw_screw_hole_offset,
            rpzw_screw_hole_offset
        ],
        [
            rpzw_width - rpzw_screw_hole_offset,
            rpzw_depth - rpzw_screw_hole_offset
        ]
    ];

    generic_base_plate(
        plate_width = rpzw_width,
        plate_depth = rpzw_depth,
        plate_height = plate_height,
        plate_fillet_radius = rpzw_fillet_radius,
        mount_post_centers = rpzw_mount_post_centers,
        mount_post_height = mount_post_height,
        metric_screw = rpzw_screw_size
    );
}

$fa = 5;
$fs = 0.25;
raspberry_pi_zero_w_base();