x = 0; y = 1; z = 2;

rs232_dim = [
    16.0,
    51.0,
    1.5
];

rs232_pegs = [
    [1, 10.5],
    [rs232_dim[x] - 1, 10.5],
    [1, 40.5],
    [rs232_dim[x] - 1, 40.5]
];

rs232_peg_r_inner = 0.75;
rs232_peg_r_outer = 1.5;

esp_dim = [
    25.75,
    48.25,
    1.5
];

esp_peg_offset = 2.5;
esp_pegs = [
    [esp_peg_offset, esp_peg_offset],
    [esp_dim[x] - esp_peg_offset, esp_peg_offset],
    [esp_peg_offset, esp_dim[y] - esp_peg_offset],
    [esp_dim[x] - esp_peg_offset, esp_dim[y] - esp_peg_offset]
];

esp_peg_r_inner = 1.5;
esp_peg_r_outer = 2;

placeholders=false;
board(esp_dim, esp_pegs, esp_peg_r_inner, esp_peg_r_outer, 10.5);
translate([5,0,0])
board(rs232_dim, rs232_pegs, rs232_peg_r_inner, rs232_peg_r_outer, 4);

translate([0,0,-2]) {
    cube([esp_dim[x], esp_dim[y], 2]);
}

module peg(inner, outer, h1, h2) {
    cylinder(r=outer, h=h1, center=false, $fn=20);
    cylinder(r=inner, h=h2, center=false, $fn=20);
}

module board(dim, pegs, r_inner, r_outer, h) {
    if (placeholders) {
        color("green")
            translate([0,0,h])
                cube(dim, center=false);
    }
    for (i=pegs) {
        translate(i)
            peg(r_inner, r_outer, h, h+1.5);
    }
}
        