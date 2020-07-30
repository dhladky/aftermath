// draws a fire symbol
// parameters:
// size - size of the battery
// height - height of the symbol (Z axis)
// centerX - if true, center horizontally
// centerY - if true, center vertically
// center - if true, center both horizontally and vertically
 module fire_symbol(size=10, height = 1, center=false, centerX=false, centerY=false) {
     translate([centerX || center ? 0: size/2, center || centerY ? 0 : size/2])
      linear_extrude(height=height)
        resize([size, size])
          import(file = "firesymbol.svg", center = true, dpi = 96) ;
 }