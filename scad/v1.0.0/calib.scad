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
use     <horizontal_plate.scad>
use     <vertical_plate.scad>
use     <rear_triangle.scad>
use     <feet.scad>

// build
translate([0,40]){
difference(){
square([75,30]);
translate([20,10]) {circle(m3_screw_radius); translate([-2,-8]) text("M3", size=2.5);};
translate([29,10]) {circle(m4_screw_radius); translate([-2,-8]) text("M4", size=2.5);};
translate([40,10]) {circle(z_rod_pocket_radius); translate([-4,-8]) text("M8_z", size=2.5);};
translate([52,10]) {circle(spooler_mount_holes_radius); translate([-4,-8]) text("M8_spool", size=2.5);};
translate([-12,8]) {feet_pockets_bolts(); translate([35,18]) text("frame fastening (M3)", size=2.5);};
//translate([25,19]) square(feet_pocket_size);
    };
};
    
difference(){
    square([75,30 - sheet_thickness]);
    translate([8, 30 - sheet_thickness]) {bolt_hole_bigbox(); translate([15,-20]) text("frame fastening (M3)", size=2.5);};
};
translate([8, 30 - sheet_thickness])
bolt_pegs();


