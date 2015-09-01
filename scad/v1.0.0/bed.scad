// iTopie RepRap - Bed
//
// @version 1.1.0
// @license GPLv3
// @docs    http://reprap.org/wiki/ITopie  
// @sources https://github.com/lautr3k/RepRap-iTopie 
// @author  Sébastien Mischler <skarab>
// @author  http://www.onlfait.ch
//
// @upddate 2015-07-05 <skarab> first write
// @upddate 2015-07-07 <skarab> add holes
include <config.scad>

// bed triangles
module _triangle(width, height) {
    minkowski() {
        circle(bed_corner_radius);
        offset(-bed_triangle_offset) 
            polygon(points=[[0, 0], [width, 0],[width / 2, height / 2]], paths=[[0, 1, 2]]);
    }
}

// bed triangles
module bed_triangles() {
    translate([bed_margin[0], bed_margin[1], 0]) {
        _triangle(bed_base_width, bed_base_height);
        translate([bed_width - (bed_margin[0] * 2), bed_height - (bed_margin[1] * 2), 0])
            rotate([0, 0, 180])
            _triangle(bed_base_width, bed_base_height);
    }
//    translate([bed_margin[0] + bed_base_width, bed_margin[1], 0])
//        rotate([0, 0, 90])
//            _triangle(bed_base_height, bed_base_width);
//    translate([bed_margin[0], bed_height - bed_margin[1], 0])
//        rotate([0, 0, 270])
//            _triangle(bed_base_height, bed_base_width);
    
}

// bed squares
module bed_squares() {
    translate([bed_margin[0] + bed_base_width / 4, bed_margin[1] + bed_base_height / 2, 0]) 
        offset(8)square([40, 20],center=true);
    translate([bed_margin[0] + 3 * bed_base_width / 4, bed_margin[1] + bed_base_height / 2, 0])
        offset(8)square([40, 20],center=true);
//    translate([bed_margin[0] + bed_base_width / 2, bed_margin[1] + bed_base_height / 4 - 10, 0])
//        offset(8)square([40, 34],center=true);   
//    translate([bed_margin[0] + bed_base_width / 2, bed_margin[1] + 3 * bed_base_height / 4 + 10, 0])     
//        offset(8)square([40, 34],center=true);

}

// bed trapeziums
module _trapezium(bottom_width, top_width, height) {
    minkowski() {
        circle(bed_corner_radius);
        offset(-bed_triangle_offset) 
            polygon(points=[[-bottom_width / 2, 0], [bottom_width / 2, 0], [top_width / 2, height], [- top_width / 2, height]], paths=[[0, 1, 2, 3]]);
    }
}

module _trap1(){
       _trapezium(0.9 *bed_base_width , 0.9 * bed_base_width / 4, 0.9 * 3 * bed_base_width / 8);
}

module bed_trapeziums() {
    // left side
    translate([-bed_margin[0] - 10, 18 + 3 * bed_base_height / 4, 0]) 
    rotate([0, 0, -90])
            _trap1();
    translate([-bed_margin[0] - 10,  4 + 1 * bed_base_height / 4, 0]) 
    rotate([0, 0, -90])
            _trap1();
    // right side
    translate([bed_margin[0] + bed_holes_spacing[1] + 0.9 * 1 * bed_base_width / 8, 18 + 3 * bed_base_height / 4, 0]) 
    rotate([0, 0, 90])
            _trap1();
    translate([bed_margin[0] + bed_holes_spacing[1] + 0.9 * 1 * bed_base_width / 8, 4 + 1 * bed_base_height / 4, 0]) 
    rotate([0, 0, 90])
            _trap1();    
    };
    


// bed cross
module bed_cross() {
    hull() {
        translate([bed_corner_radius, bed_corner_radius, 0])
            circle(bed_corner_radius);
        translate([bed_width - bed_corner_radius, bed_height - bed_corner_radius, 0])
            circle(bed_corner_radius);
    }
    hull() {
        translate([bed_corner_radius, bed_height - bed_corner_radius, 0])
            circle(bed_corner_radius);
        translate([bed_width - bed_corner_radius, bed_corner_radius, 0])
            circle(bed_corner_radius);
    }
}

// bed 3 points ergots
module bed_ergots() {
    translate([bed_width / 2, bed_corner_radius, 0]) {
        circle(bed_corner_radius);
        render() difference() {
            translate([-(2 * bed_corner_radius), 0, 0])
                square([4 * bed_corner_radius, bed_corner_radius]);
            translate([bed_corner_radius * 2, 0, 0])
                circle(bed_corner_radius);
            translate([-(bed_corner_radius * 2), 0, 0])
                circle(bed_corner_radius);
        }
    }
    translate([bed_width - bed_corner_radius, bed_height / 2, 0]) {
        circle(bed_corner_radius);
        render() difference() {
            translate([-bed_corner_radius, -(2 * bed_corner_radius), 0])
                square([bed_corner_radius, 4 * bed_corner_radius]);
            translate([0, bed_corner_radius * 2, 0])
                circle(bed_corner_radius);
            translate([0, -(bed_corner_radius * 2), 0])
                circle(bed_corner_radius);
        }
    }
}

// bed base plate
module bed_base() {
    translate([bed_half_width, bed_half_height, 0])
        square([bed_base_width, bed_base_height], center = true);
    bed_ergots();
    bed_cross();
}

// bed holes
module y_lm8_holder_holes() {
    translate([y_lm8_holder_screw_spacing / 2, 0, 0]) 
        circle(bed_holes_radius);
    translate([-y_lm8_holder_screw_spacing / 2, 0, 0]) 
        circle(bed_holes_radius);
}

// lm8uu holes
module y_lm8_holes() {
        offset(y_lm8_rounding_radius) 
        square(y_lm8_hole, center=true);
} 

// bed holes
module bed_holes() {
    // corners
    translate([bed_corner_radius, bed_corner_radius, 0])
        circle(bed_holes_radius);
    translate([bed_width - bed_corner_radius, bed_height - bed_corner_radius, 0])
        circle(bed_holes_radius);
    translate([bed_corner_radius, bed_height - bed_corner_radius, 0])
        circle(bed_holes_radius);
    translate([bed_width - bed_corner_radius, bed_corner_radius, 0])
        circle(bed_holes_radius);

    // ergots
    translate([bed_width / 2, bed_corner_radius, 0])
        circle(bed_holes_radius);
    translate([bed_width - bed_corner_radius, bed_height / 2, 0])
        circle(bed_holes_radius);

    // belt holder
    translate([bed_width / 2, bed_height / 2, 0]) {
        translate([0, y_belt_holder_screw_spacing / 2, 0]) 
            circle(bed_holes_radius);
        translate([0, -y_belt_holder_screw_spacing / 2, 0]) 
            circle(bed_holes_radius);
    }

    // lm8uu holder
    translate([bed_width / 2, bed_height / 2, 0]) {
        spacing = _y_rod_pocket_spacing / 2;
        translate([-spacing, _y_lm8_holder_vspacing, 0]) {
            y_lm8_holder_holes();
            y_lm8_holes();
        }
        translate([spacing, _y_lm8_holder_vspacing, 0]) {
            y_lm8_holder_holes();
            y_lm8_holes();
        }
        translate([-spacing, -_y_lm8_holder_vspacing, 0]) {
            y_lm8_holder_holes();
            y_lm8_holes();
        }
        translate([spacing, -_y_lm8_holder_vspacing, 0]) {
            y_lm8_holder_holes();
            y_lm8_holes();
        }
    }

    // endstop flag (screw)
    translate([bed_margin[0] + (bed_triangle_offset - bed_corner_radius) / 2, bed_height / 2]) { 
        translate([0, 9, 0])
            circle(bed_holes_radius);
        translate([0, 3, 0])
            circle(bed_holes_radius);
        translate([0, -3, 0])
            circle(bed_holes_radius);
        translate([0, -9, 0])
            circle(bed_holes_radius);
    }
}

// bed
module bed() {
    render() difference() {
        bed_base();
        bed_holes();
        bed_triangles();
        bed_squares();
        bed_trapeziums();
    }
}
bed();
//_trapezium(200, 100, 100);
//bed_trapeziums();