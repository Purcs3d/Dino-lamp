include <fillets_and_rounds.scad>

// IIIIIIIIIIIIIIIIIIIII MISC IIIIIIIIIIIIIIIIIIIIIIIIIII
$fn = 50;

TOLERANCE=0;
SHELL_RES = 50;

// IIIIIIIIIIIIIIIIIIIII BASE IIIIIIIIIIIIIIIIIIIIIIIIIII
BASE_DIA = 100;
BASE_HEI = 30;

// IIIIIIIIIIIIIIIIIIIII DIAL IIIIIIIIIIIIIIIIIIIIIIIIIII
DIAL_HEI = 20;
DIAL_OUT = 2;           //not automted at all
DIAL_INNER_DIA = 0;
DIAL_PEAK_DIST = 8;

DIAL_SHELL_THICK = 4;
DIAL_LIP_WIDTH = 2;
DIAL_LIP_THICK = 0;
DIAL_CUT_RES = SHELL_RES;

GRIP_TRACE_DEPTH=1.5;
GRIP_TRACE_NUDGE= .9;     // moves grip inwards or outwards from dial
GRIP_TRACE_OFFSET = 10; // distance between traces in mm
GRIP_TRACE_RES = SHELL_RES;
// even trace rounds down to a even number when calculating steps
EVEN_GRIP_TRACE = true;


//__main__
translate([0,0,-5])
    %Base();

Dial();

//__main__ end

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~ BASE ~~~~~~~~~~~~~~~~~~~~~~~~~~~
module Base(dia = BASE_DIA, hei = BASE_HEI, res = SHELL_RES){
    cylinder(d=dia, h=hei, $fn=res);
}

// --------------------------- BASE ---------------------------


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~ DIAL ~~~~~~~~~~~~~~~~~~~~~~~~~~~
module Dial(height = DIAL_HEI, peak_dist = DIAL_PEAK_DIST, thickness = DIAL_OUT,
            shell_thick = DIAL_SHELL_THICK, lip_width = DIAL_LIP_WIDTH, lip_thick = DIAL_LIP_THICK,
            cut_res = DIAL_CUT_RES,
            trace_depth = GRIP_TRACE_DEPTH, trace_nudge = GRIP_TRACE_NUDGE, trace_offset = GRIP_TRACE_OFFSET,
            even_trace = EVEN_GRIP_TRACE, base_dia = BASE_DIA, grip_res = GRIP_TRACE_RES,
            tolerance = TOLERANCE, res = SHELL_RES) {

    circumfrance = PI * base_dia; // from outermost diameter
    
    difference(){
        //color("#8b5d2e")   
        
        Dial_base(0, base_dia + thickness, height - tolerance, peak_dist - (tolerance/2), res);

            Dial_trace(circumfrance, trace_depth, trace_offset, (base_dia + thickness)/2 + trace_nudge, 
              grip_res);
        
        Dial_basecut(base_dia - shell_thick, height, lip_width, lip_thick);

    }
}

module Dial_base(dia_inner = 0, dia_outer, hei, peak_dist, res) {
    intersection() {   
        cylinder(d=dia_outer, h=hei, $fn=res);

        hull(){
            translate([0,0,peak_dist])
                sphere(d=dia_outer, $fn=res);
            translate([0,0,hei - peak_dist])
                sphere(d=dia_outer, $fn=res);

        }
    }
}

module Dial_basecut(dia, height, lip_width, lip_thick) {
    translate([0, 0, -.5])
        color("blue")
            cylinder(d=dia - lip_width, h=height + 1);
    translate([0, 0, -1])
        color("purple")
            cylinder(d=dia, h=height - lip_thick + 1.01);
}

module Gear_fill() {

}

module Dial_trace(circumfrance, trace_depth, trace_step, nudge,
             res, max_height = 30) {

    for (x = [0: trace_step: 360]) {
            rotate_about_pt(x, 0, [0,0,0])
                translate([nudge, 0, 0])
                    color("#654321") 
                        cylinder(d=trace_depth*2, h=max_height, $fn=res);
    }

}

// --------------------------- DIAL ------------------------------


module rotate_about_pt(z, y, pt) {
    translate(pt)
        rotate([0, y, z]) 
            translate(-pt)
                children();   
}