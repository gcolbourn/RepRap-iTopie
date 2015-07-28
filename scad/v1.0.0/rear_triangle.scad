// iTopie RepRap - Rear triangle
//
// @version 1.1.0
// @license GPLv3
// @docs    http://reprap.org/wiki/ITopie  
// @sources https://github.com/lautr3k/RepRap-iTopie 
// @author  Sébastien Mischler <skarab>
// @author  http://www.onlfait.ch
//
// @upddate 2015-07-03 <skarab> first write
// @upddate 2015-07-04 <skarab> add triangle rounded corner
include <config.scad>
use     <shapes.scad>
use     <offset.scad>

// rear triangle fingers
module rear_triangle_fingers() {
    translate([-feet_pocket_size[1], 20, 0])
        square([feet_pocket_size[1], feet_pocket_size[0]]);
    translate([-feet_pocket_size[1], (_triangle_height - 20 + feet_pocket_size[0]) / 2, 0])
        square([feet_pocket_size[1], feet_pocket_size[0]]);
    translate([-feet_pocket_size[1], _triangle_height - feet_pocket_size[0], 0])
        square([feet_pocket_size[1], feet_pocket_size[0]]);
}

// rear triangle
module _rear_triangle(width, height, angle) {
    render() difference() {
        square([width, height]);
        translate([width, 0, 0])
            rotate([0, 0, angle])
                square([width * 2, height * 2]);
    }
}

module _rear_triangle_corner(){
    render() difference() {
        minkowski() {
            offset(-triangle_radius)
                _rear_triangle(_triangle_width, _triangle_height, _triangle_angle);
            circle(triangle_radius);
        }
        square([_triangle_width, _triangle_height / 2]);
        square([triangle_radius, _triangle_height]);
    }
}


module _spool_holder(){
    rotate([0,0,45])
    difference() {
        //offset(5)square([spooler_length-10,spooler_width-10]);
        offset(5)square([spooler_length-5,spooler_width-5]);
          //square([spooler_length,spooler_width]);
        translate([spooler_length-spooler_width/2+sqrt(2)*spooler_notch_width/4,spooler_width/2-sqrt(2)*spooler_notch_width/4])
           rotate([0,0,45])
        square([spooler_notch_length,spooler_notch_width]);
                translate([spooler_length-spooler_width/2,spooler_width/2])
        circle(spooler_notch_width/2);
    }
}

// rear triangle
module rear_triangle() {
    difference(){
        union(){
        render() difference() {
        _rear_triangle(_triangle_width, _triangle_height, _triangle_angle);
        translate([triangle_radius, _triangle_height / 2, 0])
            square([_triangle_width, _triangle_height / 2]); 
    }
    _rear_triangle_corner();
    rear_triangle_fingers();
    //spool holder
//    translate([triangle_margin[3]+triangle_margin[3], _triangle_height-20, 0])
//_spool_holder();
    };
//spooler mount holes
            translate([3 * _triangle_width / 4 - 10, _triangle_height / 4, 0])
            circle(spooler_mount_holes_radius);  
            translate([1 * _triangle_width / 4 - 10, _triangle_height / 4, 0])
            circle(spooler_mount_holes_radius);  
// Mega 2560 mount holes    
//            translate([1 * _triangle_width / 4 - 18, _triangle_height / 3-3, 0])
//            _mega_holes();
    
// bowden mount holes
            translate([_triangle_width / 4 + triangle_margin[3], 3 * _triangle_height / 4, 0])
        rotate([0,0,atan( (_triangle_width - triangle_margin[3] ) / (_triangle_height + triangle_margin[3]) )]){
            circle(bowden_mount_holes_radius);  
            translate([0, bowden_mount_holes_spacing, 0])
            circle(bowden_mount_holes_radius); 
            }; 
        };
}


module rear_triangles() {
    translate([0, total_feet_height - triangle_margin[0], 0]) {
        translate([vertical_plate_borders[3] + feet_pocket_size[1] + triangle_margin[1], 0, 0]){
            difference(){
            rear_triangle();
                    translate([1 * _triangle_width / 4 - 18, _triangle_height / 3-3, 0])
            _mega_holes();
            }
            };
        translate([vertical_plate_inner_width + vertical_plate_borders[3] - feet_pocket_size[1] - triangle_margin[3], _triangle_height, 0])
            rotate([0, 0,180])
                rear_triangle();
    }
}
rear_triangles();