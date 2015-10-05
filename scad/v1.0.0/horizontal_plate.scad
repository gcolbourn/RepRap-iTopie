// iTopie RepRap - Horizontal plate
//
// @version 1.1.0
// @license GPLv3
// @docs    http://reprap.org/wiki/ITopie  
// @sources https://github.com/lautr3k/RepRap-iTopie 
// @author  Sébastien Mischler <skarab>
// @author  http://www.onlfait.ch
//
// @upddate 2015-06-27 <skarab> first write
// @upddate 2015-07-03 <skarab> add feet
// @upddate 2015-07-05 <skarab> add bed
include <config.scad>
use     <shapes.scad>
use     <feet.scad>
use     <bed.scad>

// y rod holes
module y_rod_holes() {
    center = y_rod_pocket_size[1] / 2;
    translate([-y_rod_holes_margin, center, 0])
        circle(y_rod_holes_radius);
    translate([y_rod_pocket_size[0] + y_rod_holes_margin, center, 0])
        circle(y_rod_holes_radius);
}

// y rod pockets
module _y_rod_pockets() {
    center  = (horizontal_plate_width - y_rod_pocket_size[0]) / 2;
    spacing = _y_rod_pocket_spacing / 2;
    translate([center - spacing, 0, 0]) {
        square(y_rod_pocket_size);
        y_rod_holes();
    }
    translate([center + spacing, 0, 0]) {
        square(y_rod_pocket_size);
        y_rod_holes();
    }
}

module y_rod_pockets() {
    translate([0, horizontal_plate_borders[2] - y_rod_pocket_size[1] +0.001, 0])
        _y_rod_pockets();
    translate([0, horizontal_plate_height - horizontal_plate_borders[0], 0])
        _y_rod_pockets();
}

// z plate pockets
module z_plate_pockets() {
    margin_top = horizontal_plate_height - z_plate_pocket_size[1] - z_plate_pocket_margin[0];
    translate([z_plate_pocket_margin[3], margin_top, 0])
        square(z_plate_pocket_size);
    translate([horizontal_plate_width - z_plate_pocket_size[0] - z_plate_pocket_margin[3], margin_top, 0])
        square(z_plate_pocket_size);
}

//vertical (z) plate bolt holes
module z_plate_bolt_holes() {
    margin_top = horizontal_plate_height - z_plate_pocket_size[1] - z_plate_pocket_margin[0];
    translate([z_plate_pocket_margin[3] + z_plate_pocket_size[0] 
    + (vertical_plate_borders[3]-z_plate_pocket_size[0])/2
    -4
    , margin_top + z_plate_pocket_size[1]/2, 0])
        circle(bolt_hole_width / 2);
    translate([horizontal_plate_width - z_plate_pocket_size[0] - z_plate_pocket_margin[3] 
    - (vertical_plate_borders[1]-z_plate_pocket_size[0])/2
    +4
    , margin_top + z_plate_pocket_size[1]/2, 0])
        circle(bolt_hole_width / 2);;
}

// z triangle screws holes
module z_triangle_holes() {
    center = z_triangle_pocket_size[0] / 2;
    translate([center, -z_triangle_holes_margin, 0])
        circle(z_triangle_holes_radius);
    translate([center, z_triangle_pocket_size[1] + z_triangle_holes_margin, 0])
        circle(z_triangle_holes_radius);
}

// z triangle pockets
module z_triangle_pockets() {
    margin_top = horizontal_plate_height - z_triangle_pocket_size[1] - z_triangle_pocket_margin[0];
    translate([z_triangle_pocket_margin[3], margin_top, 0]) {
        square(z_triangle_pocket_size);
        z_triangle_holes();
    }
    translate([horizontal_plate_width - z_triangle_pocket_size[0] - z_triangle_pocket_margin[1], margin_top, 0]) {
        square(z_triangle_pocket_size);
        z_triangle_holes();
    }
}

// z triangle bolt holes
module z_triangle_holes_bolts() {
    center = z_triangle_pocket_size[0] / 2;
    translate([center, (bolt_mount_spacing - feet_pocket_size[0])/2 , 0])
        circle(bolt_hole_width / 2);
}

module bolt_hole() {
    translate([(bolt_mount_spacing + feet_pocket_size[0] - bolt_hole_width)/2, - bolt_hole_depth, 0])
    square([bolt_hole_width, bolt_hole_depth]);
    translate([(bolt_mount_spacing + feet_pocket_size[0] - bolt_nut_hole_width)/2, - bolt_nut_hole_position, 0])
    square([bolt_nut_hole_width, bolt_nut_hole_depth]);

}

// z triangle pockets (bolts)
module z_triangle_pockets_bolts() {
    margin_top = horizontal_plate_height - z_triangle_pocket_size[1] - z_triangle_pocket_margin[0];
    translate([z_triangle_pocket_margin[3], margin_top, 0]) {
        {translate([0,- bolt_mount_spacing / 2,0]) square(z_triangle_pocket_size);};
        {translate([0, bolt_mount_spacing - bolt_mount_spacing/2, 0]) square(z_triangle_pocket_size);};
        z_triangle_holes_bolts();
    }
    translate([horizontal_plate_width - z_triangle_pocket_size[0] - z_triangle_pocket_margin[1], margin_top, 0]) { 
        {translate([0,- bolt_mount_spacing / 2,0]) square(z_triangle_pocket_size);};
        {translate([0, bolt_mount_spacing - bolt_mount_spacing/2, 0]) square(z_triangle_pocket_size);};
        z_triangle_holes_bolts();
    }
}
// feet screws holes
module _feet_holes() {
    center        = horizontal_plate_width / 2;
    half_pocket   = feet_pocket_size[0] / 2;
    spacing_left  = (center - feet_pocket_margin[3] - half_pocket) / 2;
    spacing_right = (center - feet_pocket_margin[1] - half_pocket) / 2;
    translate([center - spacing_left - feet_holes_margin, 0, 0])
        circle(feet_holes_radius);
    translate([center + spacing_right + feet_holes_margin, 0, 0])
        circle(feet_holes_radius);
}

// feet pockets
module _feet_pockets() {
    translate([feet_pocket_margin[3], 0, 0])
        square(feet_pocket_size);
    translate([(horizontal_plate_width - feet_pocket_size[0]) / 2, 0, 0])
        square(feet_pocket_size);
    translate([horizontal_plate_width - feet_pocket_size[0] - feet_pocket_margin[1], 0, 0])
        square(feet_pocket_size);
}

module feet_pockets() {
    translate([0, feet_pocket_margin[2], 0]) {
        _feet_pockets();
        translate([0, feet_pocket_size[1] / 2, 0])
            _feet_holes();
    }
    translate([0, horizontal_plate_height - feet_pocket_size[1] - feet_pocket_margin[0], 0]) {
        _feet_pockets();
        translate([0, feet_pocket_size[1] / 2, 0])
            _feet_holes();
    }
}

// feet bolt holes
module _feet_holes_bolts() {
    translate([feet_pocket_margin[3] + (bolt_mount_spacing + feet_pocket_size[0])/2, 0, 0])
        circle(bolt_hole_width/2);
    translate([(horizontal_plate_width - feet_pocket_size[0]) / 2 + (bolt_mount_spacing + feet_pocket_size[0]) / 2, 0, 0])
        circle(bolt_hole_width / 2);
    translate([horizontal_plate_width - feet_pocket_size[0] - feet_pocket_margin[1] + (bolt_mount_spacing + feet_pocket_size[0]) / 2, 0, 0])
        circle(bolt_hole_width / 2);
           
}

//bolt pockets
module bolt_pockets() {
   translate([0,0,0])
        square(feet_pocket_size);
   translate([bolt_mount_spacing, 0, 0])
        square(feet_pocket_size);
}

// feet pockets (bolts)
module _feet_pockets_bolts() {
    translate([feet_pocket_margin[3], 0, 0])
        bolt_pockets(); 
    translate([(horizontal_plate_width - feet_pocket_size[0]) / 2, 0, 0])
        bolt_pockets();
    translate([horizontal_plate_width - feet_pocket_size[0] - feet_pocket_margin[1], 0, 0])
        bolt_pockets() ;
}

module feet_pockets_bolts() {
    translate([-(bolt_mount_spacing)/2,0,0]) {
    translate([0, feet_pocket_margin[2], 0]) {
        _feet_pockets_bolts();
        translate([0, feet_pocket_size[1] / 2, 0])
            _feet_holes_bolts();
    }
    translate([0, horizontal_plate_height - feet_pocket_size[1] - feet_pocket_margin[0], 0]) {
        _feet_pockets_bolts();
        translate([0, feet_pocket_size[1] / 2, 0])
            _feet_holes_bolts();
    }
}
}

// horizontal base plate
module horizontal_base_plate() {
    render() difference() {
        rounded_square(horizontal_plate_width, horizontal_plate_height, corner_radius = horizontal_plate_outer_corners);
        translate([horizontal_plate_borders[3], horizontal_plate_borders[2], 0])
            rounded_square(horizontal_plate_inner_width, horizontal_plate_inner_height, corner_radius = horizontal_plate_inner_corners);
    }
}

// motor mount & z rod pockets
module motor_mount(pos = 0) {
    circle(motor_mount_holes_radius);
    translate([31, 0, 0])
        circle(motor_mount_holes_radius);
    translate([31, 31, 0])
        circle(motor_mount_holes_radius);
    translate([0, 31, 0])
        circle(motor_mount_holes_radius);
    translate([15.5, 15.5, 0]) {
        circle(12);
        // z rod pockets
        if (pos == 1) {
            translate([-z_rod_pocket_spacing, 0, 0])
                circle(z_rod_pocket_radius);
        }
        if (pos == 2) {
            translate([z_rod_pocket_spacing, 0, 0])
                circle(z_rod_pocket_radius);
        }
    }
}

// z motor mount
module z_motor_mount() {
    y_position = horizontal_plate_height - z_plate_pocket_size[1] - z_plate_pocket_margin[0] - 36.5 - z_motor_mount_margin;
    translate([((horizontal_plate_width - _z_motor_mount_spacing) / 2) - 15.5, y_position, 0])
        motor_mount(1);
    translate([((horizontal_plate_width + _z_motor_mount_spacing) / 2) - 15.5, y_position, 0])
        motor_mount(2);
}

// y idler mount
module y_idler_mount() {
    top_radius    = _y_idler_pocket_width / 2;
    bottom_radius = (y_idler_mount_width - _y_idler_pocket_width) / 4;
    render() difference() {
        translate([(horizontal_plate_width - y_idler_mount_width) / 2, horizontal_plate_borders[2], 0])
            y_mount(y_idler_mount_width, y_idler_mount_height, y_idler_mount_corners);
       // translate([(horizontal_plate_width - _y_idler_pocket_width) / 2, horizontal_plate_borders[2] + y_idler_mount_height, 0])
            mirror([0, 1, 0])
                y_mount(_y_idler_pocket_width, y_idler_pocket_height, [top_radius, top_radius, bottom_radius, bottom_radius]);
    }
}

// y idler mount
module y_idler_hole() {
    translate([horizontal_plate_width  / 2, horizontal_plate_borders[2] + y_idler_mount_height / 2, 0])
        circle(y_idler_mount_hole_radius);
}

// y motor mount
module y_motor_mount() {
    translate([(horizontal_plate_width - y_motor_mount_width) / 2, horizontal_plate_height - horizontal_plate_borders[0], 0])
        mirror([0, 1, 0])
            y_mount(y_motor_mount_width, y_motor_mount_height, y_motor_mount_corners);
}

module y_motor_pockets() {
    translate([(horizontal_plate_width - 31) / 2, horizontal_plate_height - horizontal_plate_borders[0] - 27.5, 0]) {
        motor_mount(0);
        if (y_motor_mount_angle > 0) {
            translate([31, 31, 0])
                for ( i = [1:y_motor_mount_angle] ){
                    rotate([0, 0, 180 + i])
                        motor_mount(0);
                }
        }
    }
}

// y endstop mount
module y_endstop_mount() {
    holes_center = y_endstop_mount_height / 2;
    translate([horizontal_plate_width - horizontal_plate_borders[3], horizontal_plate_height - y_endstop_mount_position, 0]) {
        render() difference() {
            rotate([0, 0, 90])
                y_mount(y_endstop_mount_height, y_endstop_mount_width, y_endstop_mount_corners);
            translate([-16.5, holes_center, 0])
                circle(y_endstop_holes_radius);
            //translate([3, holes_center, 0])
              //  circle(y_endstop_holes_radius);
        }
    }
}

// Mega 2560 mount
module mega_mount_horizontal(){
    //translate([mega_mount_holes_spacing_z1+16,349.5, 0])
    translate([mega_margin[0], horizontal_plate_height - feet_pocket_size[1] - feet_pocket_margin[0] - mega_mount_holes_spacing_y - mega_margin[1], 0])
    _mega_holes();
}

// Raspberry Pi (RPi) mount
module rpi_mount_horizontal(){
    translate([horizontal_plate_width - rpi_margin[0] - rpi_mount_holes_spacing_x,horizontal_plate_height - feet_pocket_size[1] - feet_pocket_margin[0] - rpi_mount_holes_spacing_y - rpi_margin[1], 0])
    _square_mount_holes(rpi_mount_holes_spacing_x , rpi_mount_holes_spacing_y, rpi_mount_holes_radius);
}

// PSU mount
module psu_mount_horizontal(){
    translate([psu_margin[0],feet_pocket_margin[2] + feet_pocket_size[1] + psu_margin[1], 0])
    _square_mount_holes(psu_mount_holes_spacing_x , psu_mount_holes_spacing_y, psu_mount_holes_radius);
}

// PSU socket mount
module psu_socket_mount_horizontal(){
    translate([horizontal_plate_width - psu_socket_mount_hole_x_spacing - 10, horizontal_plate_height - feet_pocket_size[1] - feet_pocket_margin[0] - psu_mount_holes_spacing_y - psu_margin[1], 0])
    _square_mount_holes(psu_socket_mount_hole_x_spacing , psu_mount_holes_spacing_y, psu_mount_holes_radius);
}

// cable mount holes
module cable_mount_horizontal(){
    translate([10, horizontal_plate_height - z_plate_pocket_margin[0] + 10, 0])
    rotate([0, 0, 90])
    _cable_mount_holes();
    translate([15, feet_pocket_margin[2] + feet_pocket_size[1] + psu_margin[1], 0])
    _cable_mount_holes();
    translate([15, feet_pocket_margin[2] + feet_pocket_size[1] + psu_margin[1]+ psu_mount_holes_spacing_y, 0])
    _cable_mount_holes();
    translate([20, feet_pocket_margin[2] + feet_pocket_size[1] + psu_margin[1]+ psu_mount_holes_spacing_y + 30, 0])
    rotate([0, 0, -45]) _cable_mount_holes();
    translate([50, feet_pocket_margin[2] + feet_pocket_size[1] + psu_margin[1]+ psu_mount_holes_spacing_y + 30, 0])
    rotate([0, 0, -45]) _cable_mount_holes();
    translate([horizontal_plate_width - horizontal_plate_borders[3] + 15, feet_pocket_margin[2] + feet_pocket_size[1] + psu_margin[1]+ psu_mount_holes_spacing_y + 30, 0])
    _cable_mount_holes();
    translate([horizontal_plate_width - horizontal_plate_borders[3] +15, horizontal_plate_height -  z_plate_pocket_margin[0] + 35, 0])
    _cable_mount_holes();
    translate([horizontal_plate_width - horizontal_plate_borders[3] + 15, feet_pocket_margin[2] + feet_pocket_size[1] + psu_margin[1] + 10, 0])
        rotate([0, 0, -45])
    _cable_mount_holes();
    translate([50, horizontal_plate_height -  z_plate_pocket_margin[0] + 35, 0])
    _cable_mount_holes();
    translate([horizontal_plate_width - rpi_margin[0] - rpi_mount_holes_spacing_x -33,horizontal_plate_height - feet_pocket_size[1] - feet_pocket_margin[0] - rpi_margin[1] - 10, 0])
    rotate([0, 0, 90]) _cable_mount_holes();
    translate([horizontal_plate_width - rpi_margin[0] - rpi_mount_holes_spacing_x -33 - 115,horizontal_plate_height - feet_pocket_size[1] - feet_pocket_margin[0] - rpi_margin[1] - 10, 0])
    rotate([0, 0, 90]) _cable_mount_holes();
};



// LCD cable through hole
module LCD_cable_through_hole(){
    translate([vertical_plate_borders[3] - 15, horizontal_plate_height - z_plate_pocket_margin[0] + 5, 0])
    square([20,10]);
}

// horizontal plate
module horizontal_plate() {
// base plate
    render() difference() {
        render() union() { 
            horizontal_base_plate();
            //translate([horizontal_plate_width, 2*(horizontal_plate_height - y_endstop_mount_position), 0]) rotate([0,0,180]) 
            y_endstop_mount();
            y_idler_mount();
            y_motor_mount();
        }
        //second hole for endstop with 19 mm mount spacing
                        translate([horizontal_plate_width - horizontal_plate_borders[3] + 2.5, horizontal_plate_height - y_endstop_mount_position + y_endstop_mount_height / 2, 0]) circle(y_endstop_holes_radius);

        if (bolt_fastening==0) z_triangle_pockets();
        if (bolt_fastening==1) z_triangle_pockets_bolts();
        z_plate_pockets();
        z_plate_bolt_holes();
        y_motor_pockets();
        y_rod_pockets();
        y_idler_hole();
        if (bolt_fastening==0) feet_pockets();
        if (bolt_fastening==1) feet_pockets_bolts();
        z_motor_mount();
        mega_mount_horizontal();
        rpi_mount_horizontal();
        psu_mount_horizontal();
        psu_socket_mount_horizontal();
        cable_mount_horizontal();
        LCD_cable_through_hole();
        translate([horizontal_plate_width-37,30,0]) text("top", size=8);
        //translate([horizontal_plate_width-43,30,0]) text("front", size=8);
    }
        if (bolt_fastening==0) translate([0, -feet_height - sheet_thickness - 20, 0]) feet();         
        if (bolt_fastening==1) translate([0, -feet_height - sheet_thickness - 20, 0]) feet_bolts();
    translate([(horizontal_plate_width - bed_width) / 2, (horizontal_plate_height - bed_height) / 2 -15, 0])
        bed();
}

horizontal_plate();