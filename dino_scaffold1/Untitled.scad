difference() {
    linear_extrude(2) 
        import("C:/Users/totte/Desktop/Deskito/projects/Dino-lamp/dino_scaffold1/dino_scaffold.svg");

        translate([0, 0, .6])
            linear_extrude(.8)
            offset(.001)
                import("C:/Users/totte/Desktop/Deskito/projects/Dino-lamp/dino_scaffold1/dino_indent.svg");
}