// iTopie RepRap - Main file
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
// @upddate 2015-07-03 <skarab> add: feet
include <config.scad>

psu_width                  = 114;                        // width of PSU
psu_height                 = 49;                         // height of PSU
psu_socket_hole_width      = 30.5;                       // width of PSU socket hole
psu_socket_hole_height     = 22.5;                       // height of PSU socket hole
psu_socket_mount_spacing   = 40;                         // distance between holes for socket mount bolts
psu_socket_mount_hole_r    = m3_screw_radius*1.2;            // radius of socket mount holes
psu_switch_hole_width      = 30.5;                       // width of PSU socket hole
psu_switch_hole_height     = 25.5;                       // height of PSU socket hole
psu_mount_top_hole_margin  = 9;                          // distance from side of plastic PSU socket and switch mount to top mounting hole
psu_mount_thickness = 4;                                 // thickness of plastic PSU socket and switch mount

rotate([90,0,0])
difference(){
    cube([psu_width,psu_margin[0]+10,psu_mount_thickness]);
    translate([psu_mount_top_hole_margin, psu_margin[0], 0]) cylinder(h=psu_mount_thickness,r=psu_socket_mount_hole_r);
    translate([psu_mount_top_hole_margin + psu_mount_holes_spacing_y, psu_margin[0], 0]) cylinder(h=psu_mount_thickness,r=psu_socket_mount_hole_r);
};

difference(){
    cube([psu_width,psu_height,psu_mount_thickness]);
    translate([psu_mount_top_hole_margin + psu_socket_mount_spacing/2,psu_height/2,0])
    cube([psu_socket_hole_width,psu_socket_hole_height,psu_mount_thickness*2],center=true);
    translate([psu_mount_top_hole_margin,psu_height/2,0]) cylinder(h=psu_mount_thickness,r=psu_socket_mount_hole_r);
    translate([psu_mount_top_hole_margin + psu_socket_mount_spacing,psu_height/2,0]) cylinder(h=psu_mount_thickness,r=psu_socket_mount_hole_r);
    translate([3*psu_width/4,psu_height/2,0])
    cube([psu_switch_hole_width,psu_switch_hole_height,psu_mount_thickness*2],center=true);
};