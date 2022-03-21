include <gears.scad>

hohlrad (modul=2, zahnzahl=46, breite=width, randbreite=rim_width, eingriffswinkel=pressure_angle, schraegungswinkel=finalHelixAngle);
// translate([36, 0, 0])
	stirnrad (modul=2, zahnzahl=10, breite=4, bohrung=bore, nabendurchmesser=final_hub_diameter, nabendicke=final_hub_thickness, eingriffswinkel=pressure_angle, schraegungswinkel=finalHelixAngle, optimiert=optimized);