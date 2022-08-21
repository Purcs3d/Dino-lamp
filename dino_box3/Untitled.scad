include <gears.scad>;

/* difference(){
    planetary_gear(modul=2, sun_teeth=31, planet_teeth=14, number_planets=3, 
               width=10, rim_width=4, bore=10, pressure_angle=30, helix_angle=25,
               together_built=true, optimized=true);


} */
difference() {
    planetary_gear(modul=1, sun_teeth=28, planet_teeth=14, number_planets=3, 
                width=10, rim_width=4, bore=5, pressure_angle=18, helix_angle=30,
                together_built=true, optimized=true);


    translate ([0, 0, 12])
        sphere(d=20);
}
