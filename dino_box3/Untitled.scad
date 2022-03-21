include <gears.scad>;

difference(){
    planetary_gear(modul=2, sun_teeth=34, planet_teeth=10, number_planets=3, 
               width=10, rim_width=4, bore=10, pressure_angle=30, helix_angle=20,
               together_built=false, optimized=true);

    translate ([76, 00, 0])
        cube([30, 200, 30], true);
    
}
