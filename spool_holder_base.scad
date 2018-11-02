module mirror_copy(v = [1, 0, 0])
{
    children();
    mirror(v) children();
}

t = 10;
holder_t = 4.5;
spool_size = 80;
rib = 20;
keel_size = 37;
sub_keel_size = 4;
spacing = 9;
width = rib + holder_t + spool_size + holder_t + rib;
height = rib * 2 + keel_size + sub_keel_size * 2 + spacing * 2;

module object()
{
    translate([-width/2, -height/2, 0])
    {
        difference()
        {
            cube([width/2, height/2, t]);
            translate([rib, 0 , 0]) cube([holder_t, rib, t]);
            translate([rib, rib, t/2]) cube([holder_t, keel_size/2 + spacing + sub_keel_size, t/2]); 
            translate([rib, rib+sub_keel_size, 0]) cube([holder_t, spacing, t]);
            
        }
    }
}

union() mirror_copy([1, 0, 0]) mirror_copy([0, 1, 0]) object();