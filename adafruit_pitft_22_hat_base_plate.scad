use <generic_base_plate.scad>

module adafruit_pitft_22_hat_base(
    // thickness of base plate
    plate_height = 3,
    // mounting point height above plate
    mount_post_height = 2,
) {
    // https://learn.adafruit.com/adafruit-2-2-pitft-hat-320-240-primary-display-for-raspberry-pi/downloads#fabrication-print-2034028
    ap2h_width = 65.02;
    ap2h_depth  = 56.39;
    ap2h_fillet_radius = 3;
    ap2h_screw_size = 2.5;

    // Screw hole centers are consistently offset from the x and y edges.
    ap2h_screw_hole_offset = 3.56;
    // Mounting point centers expressed as [x,y]
    ap2h_mount_post_centers = [
        [
            ap2h_screw_hole_offset,
            ap2h_screw_hole_offset
        ],
        [
            ap2h_screw_hole_offset,
            ap2h_depth - ap2h_screw_hole_offset
        ],
        [
            ap2h_width - ap2h_screw_hole_offset,
            ap2h_screw_hole_offset
        ],
        [
            ap2h_width - ap2h_screw_hole_offset,
            ap2h_depth - ap2h_screw_hole_offset
        ]
    ];

    generic_base_plate(
        plate_width = ap2h_width,
        plate_depth = ap2h_depth,
        plate_height = plate_height,
        plate_fillet_radius = ap2h_fillet_radius,
        mount_post_centers = ap2h_mount_post_centers,
        mount_post_height = mount_post_height,
        metric_screw = ap2h_screw_size
    );
}

$fa = 5;
$fs = 0.25;
adafruit_pitft_22_hat_base();