// PSX serial experimenters connector
// originally from https://github.com/hornc/psx-serial-expts
// modified by Stephen Whittle 2025

// Width of contact channels:
width = 0.62;

module ridge() {
    cube([width, 19, 2]);
}
union()
{
    // connector
    translate([14,20,0])
    {
        rotate(180)
        {
            difference() {
                cube([14, 20, 1.4]);
                translate([1.7 + width, -0.1, -0.1]) {
                    cube([15*width + .5 , width + 2, 2.5]);
                }
            }


            for ( i = [1 : 2 : 17]){
				translate([1.7 + 17*width - i * width, 1, 0]) {
				  ridge();
				}
            }


            // Top bar
            translate([1.7, 3, 1.3]) {
                 cube([17*width, 2, width]);   
            }

        }
    }
    // protoboard mounting plate
    translate([-3.08, -10, 0])
    {
        difference(){
            cube([20.16,10,1.4]);
            translate([2.12,2.54, 0])
            {
                cylinder(h=2, d=2.2, $fn=30);
            }
            translate([2.12 + 15.9,2.54, 0])
            {
                cylinder(h=2, d=2.2, $fn=30);
            }
        }
    }
}
