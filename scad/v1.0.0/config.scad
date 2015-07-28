// iTopie RepRap - Configuration
//
// @version 1.1.0
// @license GPLv3
// @docs    http://reprap.org/wiki/ITopie  
// @sources https://github.com/lautr3k/RepRap-iTopie 
// @author  Sébastien Mischler <skarab>
// @author  http://www.onlfait.ch
//
// @upddate 2015-06-27 <skarab> first write
// @update  2015-07-02 <skarab> add: vertical plate
// @upddate 2015-07-03 <skarab> add: feet and triangle
$fn = 50;

// ---------------------------------------------------------------- //
// horizontal plate ----------------------------------------------- //
// ---------------------------------------------------------------- //
// sheet thickness (raw material)
sheet_thickness                = 18;                    // raw sheet thickness

// ---------------------------------------------------------------- //
// shortcuts ------------------------------------------------------ //
// ---------------------------------------------------------------- //
m3_screw_radius                = 1.5;                   // M3 screw radius
m4_screw_radius                = 2;                     // M4 screw radius

// ---------------------------------------------------------------- //
// horizontal plate ----------------------------------------------- //
// ---------------------------------------------------------------- //

// horizontal plate
horizontal_plate_width         = 390;                   // outer width
horizontal_plate_height        = 440;                   // outer height
horizontal_plate_borders       = [40, 82, 40, 82];      // borders weight       [top, right, bottom, left]
horizontal_plate_outer_corners = [10, 10, 10, 10];      // outer corners radius [topLeft, topRight, bottomRight, bottoLeft]
horizontal_plate_inner_corners = [30, 30, 30, 30];      // inner corners radius [topLeft, topRight, bottomRight, bottoLeft]

// y idler mount
y_idler_mount_width            = 44;                    // idler mount width
y_idler_mount_height           = 24;                    // idler mount height
y_idler_mount_corners          = [5, 5, 10, 10];        // corners radius [topLeft, topRight, bottomRight, bottoLeft]

// y idler pocket
y_idler_pocket_width           = undef;                 // idler pocket width [undef = auto]
y_idler_pocket_height          = y_idler_mount_height;  // idler pocket height

// y motor mount
y_motor_mount_width            = 50;                    // motor mount width
y_motor_mount_height           = 36;                    // motor mount width
y_motor_mount_corners          = [5, 5, 10, 10];        // corners radius [topLeft, topRight, bottomRight, bottoLeft]
y_motor_mount_angle            = 8;                     // motor rotation angle (belt tensionner) 0 = disabled

// motor mounts
motor_mount_holes_radius       = m3_screw_radius;       // motor screw holes radius

// y endstop mount
y_endstop_mount_width          = 25;                    // endstop mount width
y_endstop_mount_height         = 16.4;                  // endstop mount width
y_endstop_mount_corners        = [8.2, 8.2, 10, 10];    // corners radius [topLeft, topRight, bottomRight, bottoLeft]
y_endstop_mount_position       = 82;                    // from the frame top border to the endstop top border

// y endstop screws holes
y_endstop_holes_radius         = m3_screw_radius;       // endstop screws holes radius
y_endstop_holes_spacing        = 9.5;                   // between the two endstop screws (axis to axis)

// y rod pockets
y_rod_pocket_size              = [8, 20];               // pockets size   [width, height]
y_rod_pocket_spacing           = undef;                 // pockets spacing (axis to axis) [undef = auto]

// y rod holes
y_rod_holes_radius             = m3_screw_radius;       // y rod screws holes radius
y_rod_holes_margin             = 4;                     // y rod screws margin (from y rod pocket border)

// feet pockets
feet_pocket_size               = [20, sheet_thickness]; // pockets size   [width, height]
feet_pocket_margin             = [10.5, 40, 10.5, 40];  // pockets margin [top, right, bottom, left]

// feet holes
feet_holes_radius              = m4_screw_radius;       // feet screws holes radius
feet_holes_margin              = 10;                    // feet screws horizontal margin (for fine adjustement)

// z triangle pockets
z_triangle_pocket_size         = [sheet_thickness, 20]; // pockets size   [width, height]
z_triangle_pocket_margin       = [63, 22, undef, 22];   // pockets margin [top, right, ---, left]

// feet holes
z_triangle_holes_radius        = m4_screw_radius;       // z triangle screws holes radius
z_triangle_holes_margin        = 20;                    // z triangle screws margin (from z triangle pocket border)

// z plate pockets
z_plate_pocket_size            = [40, sheet_thickness]; // pockets size   [width, height]
z_plate_pocket_margin          = [138, 0, undef, 0];    // pockets margin [top, right, ---, left]        

// z motor mount
z_motor_mount_margin           = 8;                     // between the "motor" and the "z_plate" (border to border)
z_motor_mount_spacing          = undef;                 // between the two motor mount (axis to axis) [undef = auto]

// z motor mount
z_rod_pocket_spacing           = 17;                    // between the "motor" and the "z rod" (axis to axis)
z_rod_pocket_radius            = 4;                     // z smoothe rod radius

// z rod top holder
z_rod_holder_holes_radius      = m3_screw_radius;       // z rod top holder holes radius
z_rod_holder_holes_margin      = [12, 6];               // [top, between the z rod and the first holder hole (axis to axis)]
z_rod_holder_holes_spacing     = 20;                    // between the two holder holes (axis to axis)

// ---------------------------------------------------------------- //
// vertical plate ------------------------------------------------- //
// ---------------------------------------------------------------- //

// logo
include_logo_1               = 1;                       // include logo 1 [1 = yes; 0 = no]
include_logo_2               = 2;                       // include logo 2 [2 = yes; 0 = no]
nlogos = include_logo_1 + include_logo_2;
dxf_logo_1                   = "SemiU_logo_engrave9a.dxf";// path to DXF logo 1 [left of LCD if both logos present]
dxf_logo_2                   = "logo.dxf";              // path to DXF logo 2 [right of LCD if both logos present]

// LCD mount
lcd_screen_width             = 73;                      // width of LCD screen
lcd_screen_height            = 40;                      // height of LCD screen
lcd_screen_vertical_offset   = 9;                       // vertical offset of LCD screen position (so dial can fit underneath)
lcd_mount_holes_spacing_x    = 83;                      // horizontal spacing of LCD mount holes
lcd_mount_holes_spacing_z    = 65;                      // vertical spacing of LCD mount holes
lcd_mount_holes_offset_x     = 7.5;                     // horizontal offset of LCD mount holes from top right of screen
lcd_mount_holes_offset_z     = 12.5;                    // vertical offset of LCD mount holes from top right of screen
lcd_mount_holes_radius       = m3_screw_radius;         // LCD mount holes radius
lcd_dial_hole_offset_x       = 0;                       // horizontal offset of LCD dial hole from top right of screen
lcd_dial_hole_offset_z       = -lcd_screen_height - 24; // vertical offset of LCD dial hole from top right of screen
lcd_dial_hole_radius         = 7.5;                     // LCD dial hole radius
lcd_reset_hole_offset_x      = -33;                     // horizontal offset of LCD reset hole from bottom left of screen
lcd_reset_hole_offset_z      = lcd_dial_hole_offset_z;  // vertical offset of LCD reset hole from bottom left of screen
lcd_reset_hole_radius        = 2;                       // LCD reset hole radius
lcd_contrast_hole_offset_x   = -lcd_screen_width;       // horizontal offset of LCD contrast hole from bottom left of screen
lcd_contrast_hole_offset_z   = -lcd_screen_height - 20;  // vertical offset of LCD contrast hole from bottom left of screen
lcd_contrast_hole_radius     = 4;                       // LCD contrast hole radius

// vertical plate
vertical_plate_width         = horizontal_plate_width;  // outer width
vertical_plate_height        = horizontal_plate_height; // outer height
vertical_plate_borders       = [100, 60, undef, 60];     // borders weight       [top, right, bottom, left]
vertical_plate_outer_corners = [10, 10, 10, 10];        // outer corners radius [topLeft, topRight, bottomRight, bottoLeft]
vertical_plate_inner_corners = [10, 10, 10, 10];        // inner corners radius [topLeft, topRight, bottomRight, bottoLeft]

// ---------------------------------------------------------------- //
// feet ----------------------------------------------------------- //
// ---------------------------------------------------------------- //
feet_width                   = horizontal_plate_width;  // feet width...
feet_height                  = 60;                      // feet height...
feet_corners                 = [10, 10, 10, 10];        // corners radius [leftOut, leftIn, rightIn, rightOut]
feet_gap_height              = 40;                      // gap height ?

// ---------------------------------------------------------------- //
// triangle ------------------------------------------------------- //
// ---------------------------------------------------------------- //
triangle_width               = undef;                   // rear triangle width         [undef = auto]
triangle_height              = undef;                   // rear triangle height        [undef = auto]
triangle_angle               = undef;                   // rear triangle angle         [undef = auto]
triangle_margin              = [20, 20, undef, 20];     // rear triangle margin        [top, right, bottom, left]
triangle_radius              = 10;                      // rear triangle corner radius [undef = auto]

spooler_length               = 100;                     // length of arm for spool mount
spooler_width                = 30;                      // width of arm for spool mount
spooler_notch_length         = 25;                      // length of notch for rod to slide into for spool mount
spooler_notch_width          = 8;                       // width of notch for rod to slide into for spool mount [M8 threaded rod]

spooler_mount_holes_radius   = 8;                       // radius of spooler mount holes (M8; for spool to be placed at side of printer)

bowden_mount_holes_spacing   = 32;                      // spacing between bowden mount holes
bowden_mount_holes_radius    = m4_screw_radius;         // radius of bowden mount holes

// ---------------------------------------------------------------- //
// mount holes for electronics ------------------------------------ //
// ---------------------------------------------------------------- //
mega_mount_holes_spacing_x1  = 75;                      // spacing between Mega 2560 mount holes (x1)
mega_mount_holes_spacing_x2  = 82.5;                    // spacing between Mega 2560 mount holes (x2)
mega_mount_holes_spacing_y   = 48.5;                    // spacing between Mega 2560 mount holes (horizontal)
mega_mount_holes_radius      = m3_screw_radius;         // radius of Mega 2560 mount holes
mega_margin                 = [8, 13];                  // spacing of holes from edge of RAMPS [x, y] (x should be 30, but not enough space for 3 holes that way)

module _mega_holes(){
            circle(mega_mount_holes_radius);  
            // This hole removed as too close to y endstop mount:
            // translate([mega_mount_holes_spacing_x1, 0, 0]) circle(mega_mount_holes_radius);  
            translate([0, mega_mount_holes_spacing_y, 0]) circle(mega_mount_holes_radius);
            translate([mega_mount_holes_spacing_x2, mega_mount_holes_spacing_y, 0]) circle(mega_mount_holes_radius);  
}

psu_mount_holes_spacing_x  = 177.5;                      // spacing between PSU mount holes (x)
psu_mount_holes_spacing_y  = 95;                         // spacing between PSU mount holes (y)
psu_mount_holes_radius     = m3_screw_radius;            // radies of PSU mount holes
psu_margin                 = [30, 10];                   // spacing of holes from edge of PSU [x, y]

rpi_mount_holes_spacing_x  = 57;                         // spacing between Raspberry Pi mount holes (x)
rpi_mount_holes_spacing_y  = 48;                         // spacing between Raspberry Pi mount holes (y)
rpi_mount_holes_radius     = m3_screw_radius;            // radies of Raspberry Pi mount holes
rpi_margin                 = [65, 5];                    // spacing of holes from edge of Raspberry Pi [x, y]

module _square_mount_holes(x, y, r){
            circle(r);  
            translate([x , 0, 0]) circle(r);  
            translate([0, y, 0]) circle(r);  
            translate([x , y, 0]) circle(r);  
}

cable_mount_holes_spacing   = 10;                        // spacing between cable mount holes (for tidying cables)
cable_mount_holes_radius    = m3_screw_radius;           // radius of Mega 2560 mount holes

module _cable_mount_holes(){
            circle(cable_mount_holes_radius);  
            translate([cable_mount_holes_spacing , 0, 0]) circle(cable_mount_holes_radius);  
}

// ---------------------------------------------------------------- //
// bed ------------------------------------------------------------ //
// ---------------------------------------------------------------- //
bed_holes_spacing            = [209, 209];              // bed screws holes spacing (axis to axis) [MK2/3 = [x:209, y:209]]
bed_corner_radius            = 5.5;                     // bed corners radius
bed_margin                   = [11, 11];                // bed outer margin [x, y]
bed_holes_radius             = m3_screw_radius;         // bed screw radius
bed_triangle_offset          = 24;                      // bed triangle inner offset

// y belt holder
y_belt_holder_screw_spacing = 16;                       // y belt holder holes spacing (axis to axis) 

// y lm8uu holder
y_lm8_holder_screw_spacing  = 24;                       // y lm8uu holder holes spacing (axis to axis) 
y_lm8_holder_vspacing       = undef;                    // lm8uu holder vertical spacing (axis to axis)

// ---------------------------------------------------------------- //
// --- CHANGE NOTHING BELOW, UNLESS YOU KNOW WHAT YOU ARE DOING --- //
// ---------------------------------------------------------------- //

// horizontal plate computed borders [top+bottom, left+right]
horizontal_plate_computed_borders = [horizontal_plate_borders[0] + horizontal_plate_borders[2], horizontal_plate_borders[1] + horizontal_plate_borders[3]];

// horizontal plate inner size
horizontal_plate_inner_width  = horizontal_plate_width - horizontal_plate_computed_borders[1];
horizontal_plate_inner_height = horizontal_plate_height - horizontal_plate_computed_borders[0];

// y rod pockets auto spacing
_y_rod_pocket_spacing = y_rod_pocket_spacing ? y_rod_pocket_spacing : (horizontal_plate_inner_width) / 2;

// y rod pockets auto spacing
_z_motor_mount_spacing = z_motor_mount_spacing ? z_motor_mount_spacing : horizontal_plate_width - 60;

// y idler pocket auto width
_y_idler_pocket_width = y_idler_pocket_width ? y_idler_pocket_width : y_idler_mount_width - 20;

// ---------------------------------------------------------------- //

// vertical plate computed borders [top+bottom, left+right]
vertical_plate_computed_borders = [vertical_plate_borders[0], vertical_plate_borders[1] + vertical_plate_borders[3]];

// vertical plate inner size
vertical_plate_inner_width  = vertical_plate_width - vertical_plate_computed_borders[1];
vertical_plate_inner_height = vertical_plate_height - vertical_plate_computed_borders[0];

// total feet height
total_feet_height = feet_height + sheet_thickness;

// triangles max size
triangle_max_width  = z_plate_pocket_margin[0];
triangle_max_height = vertical_plate_inner_height - total_feet_height;

// triangles auto size
_triangle_width  = triangle_width && triangle_width <= triangle_max_width  ? triangle_width  : triangle_max_width;
_triangle_height = triangle_height && triangle_height <= triangle_max_height ? triangle_height : triangle_max_height;
_triangle_angle  = triangle_angle  ? triangle_angle  : ceil((atan(_triangle_width / _triangle_height) / 4) * 3);

// bed auto size
bed_width  = bed_holes_spacing[0] + (bed_corner_radius * 2);
bed_height = bed_holes_spacing[1] + (bed_corner_radius * 2);

bed_half_width  = bed_width  / 2;
bed_half_height = bed_height / 2;

bed_base_width  = bed_width  - (bed_margin[0] * 2);
bed_base_height = bed_height - (bed_margin[1] * 2);

_y_lm8_holder_vspacing = y_lm8_holder_vspacing ? y_lm8_holder_vspacing : bed_height / 4;