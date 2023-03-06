use <generic_base_plate.scad>

module powerboost_1000_base(
    // thickness of base plate
    plate_height = 3,
    // mounting point height above plate
    mount_post_height = 2,
) {
    // https://learn.adafruit.com/adafruit-powerboost-1000c-load-share-usb-charge-boost/downloads#fabrication-print-2000498
    pb_width = 36.2;
    pb_depth = 22.86;
    pb_fillet_radius = 2.5;
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
            pb_depth - pb_screw_hole_offset
        ]
    ];

    generic_base_plate(
        plate_width = pb_width,
        plate_depth = pb_depth,
        plate_height = plate_height,
        plate_fillet_radius = pb_fillet_radius,
        mount_post_centers = pb_mount_post_centers,
        mount_post_height = mount_post_height,
        metric_screw = pb_screw_size
    );
}

$fa = 5;
$fs = 0.25;
powerboost_1000_base();