// iTopie RepRap - Vertical plate
//
// @version 1.1.0
// @license GPLv3
// @docs    http://reprap.org/wiki/ITopie  
// @sources https://github.com/lautr3k/RepRap-iTopie 
// @author  Sébastien Mischler <skarab>
// @author  http://www.onlfait.ch
//
// @upddate 2015-07-02 <skarab> first write
// @upddate 2015-07-03 <skarab> add feet
// @upddate 2015-07-06 <skarab> add missed holes
include <config.scad>
use     <shapes.scad>
use     <rear_triangle.scad>
use     <feet.scad>

// triangles screws holes
module z_triangle_holes() {
    half_pocket = feet_pocket_size[0] / 2;
    min = 20 + half_pocket;
    max = _triangle_height - feet_pocket_size[0] + half_pocket;
    mid = (max - min) / 4;
    
    translate([0, min + mid, 0])
        circle(z_triangle_holes_radius);
    translate([0, max - mid, 0])
        circle(z_triangle_holes_radius);
}

// z rod holder holes
module z_rod_holder_holes() {
    circle(z_rod_holder_holes_radius);
    translate([z_rod_holder_holes_spacing, 0, 0])
        circle(z_rod_holder_holes_radius);
}

// logos and LCD mount holes
module _logo_1(){
                translate([0, vertical_plate_height - (vertical_plate_borders[0] / 2) - total_feet_height, 0])
                scale([0.12,0.12,0])
                import(dxf_logo_1);
}

module _logo_2(){
            translate([0, vertical_plate_height - (vertical_plate_borders[0] / 2) - total_feet_height, 0])
                scale([0.75,0.75,0])
                import(dxf_logo_2);
}

module _lcd(){
            translate([0, lcd_screen_vertical_offset + vertical_plate_height - (vertical_plate_borders[0] / 2) - total_feet_height, 0])
            {
            offset(5)square([lcd_screen_width-10,lcd_screen_height-10],center=true);
                for(i = [-1,1]){
                    for(j = [-1,1]){
            translate([i * (lcd_screen_width / 2 + lcd_mount_holes_offset_x),j * (lcd_screen_height / 2 + lcd_mount_holes_offset_z), 0])
            circle(lcd_mount_holes_radius);
                };
            };
            translate([lcd_screen_width / 2 + lcd_dial_hole_offset_x
,lcd_screen_height / 2 + lcd_dial_hole_offset_z, 0])
                        circle(lcd_dial_hole_radius);
            translate([lcd_screen_width / 2 + lcd_reset_hole_offset_x
,lcd_screen_height / 2 + lcd_reset_hole_offset_z, 0])
                        circle(lcd_reset_hole_radius);
            translate([lcd_screen_width / 2 + lcd_contrast_hole_offset_x
,lcd_screen_height / 2 + lcd_contrast_hole_offset_z, 0])
                        circle(lcd_contrast_hole_radius);
            };
        }

// vertical base plate
module vertical_base_plate() {
    translate([0, total_feet_height, 0]) {
        render() difference() {
            rounded_square(vertical_plate_width, vertical_plate_height - total_feet_height, corner_radius = [vertical_plate_outer_corners[0], vertical_plate_outer_corners[1], 0, 0]);
            translate([vertical_plate_borders[3], 0, 0])
                y_mount(vertical_plate_inner_width, vertical_plate_inner_height - total_feet_height, [vertical_plate_inner_corners[0], vertical_plate_inner_corners[1], 0, 0]);
            translate([z_triangle_pocket_margin[3] + z_triangle_pocket_size[0], 0, 0])
                rear_triangle_pockets();
            translate([vertical_plate_width - z_triangle_pocket_margin[1], 0, 0])
                rear_triangle_pockets();
            // Logos
            if (nlogos == 1) {
            translate([1 * vertical_plate_width / 3,0,0]) 
                _logo_1();
            translate([2 * vertical_plate_width / 3,0,0]) 
                _lcd();                
            };
            if (nlogos == 2) {
            translate([1 * vertical_plate_width / 3,0,0]) 
                _logo_2();
            translate([2 * vertical_plate_width / 3,0,0]) 
                _lcd();    
            };
            if (nlogos == 3) {
            translate([1 * vertical_plate_width / 4,0,0]) 
                _logo_1();
            translate([1 * vertical_plate_width / 2,0,0]) 
                _lcd();    
            translate([3 * vertical_plate_width / 4,0,0]) 
                _logo_2();
            };
 
            
            //square([73,40],center=true);
            translate([vertical_plate_borders[3] / 2, 0, 0])
                z_triangle_holes();
            translate([vertical_plate_width - (vertical_plate_borders[1] / 2), 0, 0])
                z_triangle_holes();
            translate([0, vertical_plate_height - total_feet_height - z_rod_holder_holes_spacing, 0]) {
                width  = (horizontal_plate_width - _z_motor_mount_spacing) / 2;
                margin = width - z_rod_pocket_spacing + z_rod_holder_holes_margin[1];
                translate([margin, 0, 0])
                    z_rod_holder_holes();
                translate([horizontal_plate_width - z_rod_holder_holes_spacing - margin, 0, 0])
                    z_rod_holder_holes();
            }
        }
    }
    rounded_square(z_plate_pocket_size[0], total_feet_height, corner_radius = [0, 0, feet_corners[1], feet_corners[0]]);
    translate([vertical_plate_width - z_plate_pocket_size[0], 0, 0])
        rounded_square(z_plate_pocket_size[0], total_feet_height, corner_radius = [0, 0, feet_corners[3], feet_corners[2]]);
}

// rear triangle pockets
module rear_triangle_pockets() {
    rear_triangle_fingers();
}

// vertical plate
module vertical_plate() {
    vertical_base_plate();
    rear_triangles();
    translate([0, -feet_height - sheet_thickness - 20, 0])
        feet();
}
vertical_plate();