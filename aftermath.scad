use <scad-commons/dice_symbol.scad>;
use <scad-commons/target_symbol.scad>;
use <scad-commons/magnifying_glass_symbol.scad>;
use <scad-commons/battery_symbol.scad>;
use <scad-commons/holes.scad>

boxSizeX = 136;
boxSizeY = 154;
wallThickness=2;
symbolHeight = 1;
symbolSize=6;
fontSize = 3;

$holes_bottom_part_top = 22;
$holes_bottom_thickness = 2;


// ------------------------------------------------------------

// the other tokens
otherTokensX = 80;
otherTokensY = 55;

// fire tokens
fireTokensX = 20;
fireTokensY = 13; 

// target tokens
targetTokensX = 16;
targetTokensY = 8;

// party token
partyTokenX = 31;
partyTokenY = 3;
partyTokenHeight = 20;

// search tokens
searchTokensX = 20;
searchTokens2Y = 20;
searchTokens3Y = 20;
searchTokens4Y = 12;

//  battery tokens
batteryTokensX = 15;
batteryTokensY = 20;
batteryTokensHeight = 25;

// cocroach tokens
cocroachTokensX = 20;
cocroachTokensY = 18;
cocroachTokensHeight = 20;

// hornet tokens
hornetTokensX = 20;
hornetTokensY = 10;
//hornetTokensHeight = todo!

// computations 
//safeTop = boxSizeHeight + 10; // big enough ceiling

otherTokensTop = otherTokensY+wallThickness;

fireTokensPositionX = 2*wallThickness+otherTokensX;
fireTokensPositionY = 2* wallThickness;

targetTokensPositionX = boxSizeX-2*wallThickness-targetTokensX;
targetTokensPositionY= 2*wallThickness+fireTokensY-targetTokensY;

searchTokensFingerHoleX = searchTokensX / 2;

partyTokenPositionY = targetTokensPositionY+symbolSize+15;
partyMiddle = (boxSizeX - wallThickness - otherTokensX)/2+ wallThickness + otherTokensX;

difference(){

  cube([boxSizeX, boxSizeY, boxSizeHeight]);
    
//  linear_extrude(height=boxSizeHeight)  
//  polygon([[wallThickness, 0.0001],[boxSizeX-wallThickness, 0.0001], [boxSizeX-2*wallThickness, -wallThickness], [2*wallThickness, -wallThickness]]) ; 
//      
//  linear_extrude(height=boxSizeHeight)  
//  polygon([[wallThickness, boxSizeY-0.0001],[boxSizeX-wallThickness, boxSizeY-0.0001], [boxSizeX-2*wallThickness, boxSizeY+wallThickness], [2*wallThickness, boxSizeY+wallThickness]]) ; 

  
  // from here token holes
  //---------------------------------
  
  // the other tokens
//  translate([wallThickness, wallThickness, 0])
//     cube([otherTokensX, otherTokensY, safeTop]);
  
  hole(size=[otherTokensX, otherTokensY], position=[wallThickness, wallThickness]) {
      text("Other", halign="center", size=fontSize );
  } 
 
  
  fireTokensPositionX = 2*wallThickness+otherTokensX;
  fireTokensPositionY = 2* wallThickness;
 
 
// 
//  translate([fireTokensPositionX, fireTokensPositionY, topLevel-fireTokensX/2])
//     cube([fireTokensX, fireTokensY, safeTop]);
//  
//  // target tokens
//  translate([targetTokensPositionX, targetTokensPositionY , topLevel-targetTokensX/2])
//    cube([targetTokensX, targetTokensY, safeTop]);
//    
//  // party token
//  translate([partyMiddle, partyTokenPositionY, safeTop/2+topLevel - partyTokenHeight/2])
//    cube([partyTokenX, partyTokenY, safeTop], center = true);  
//    
//  // dice
//  diceX = 34;
//  diceY = 17;
//
//  diceBottom=topLevel-diceY/2;
//  translate([partyMiddle-diceX/2, otherTokensTop-diceY, diceBottom])
//    cube([diceX, diceY, safeTop]);  
//    
//  translate([partyMiddle, otherTokensTop-diceY/2,diceBottom-symbolHeight])  
//     dice_symbol(center=true, height = safeTop) ; 
//  
//  translate([partyMiddle, otherTokensTop-diceY/2,topLevel])
//    rotate([0, 90, 0])
//     cylinder(h=diceX+fingerHoleExtend*2, r=fingerHoleRadius, center=true);
//  
//  // search tokens
//  //-------------------------------------------------------------------------------
//  searchTokenPositionY = otherTokensY + 2*wallThickness + searchTokens2Y;
//  
//  // tokens 2  
//  holeWithPictureAndFingerHoles(x=wallThickness, y=searchTokenPositionY-searchTokens2Y, size=[searchTokensX, searchTokens2Y, searchTokensX]) {
//      magnifying_glass(text="2", height=symbolHeight+1, size=symbolSize, center=true);
//  }
// 
//  // tokens 3
//
//  holeWithPictureAndFingerHoles(x=2*wallThickness+searchTokensX, y=searchTokenPositionY-searchTokens3Y, size=[searchTokensX, searchTokens3Y, searchTokensX]) {
//      magnifying_glass(text="3", height=symbolHeight+1, size=symbolSize, center=true);
//  }
//
//  // tokens 4
//  holeWithPictureAndFingerHoles(x=3*wallThickness+2*searchTokensX, y=searchTokenPositionY-searchTokens4Y, size=[searchTokensX, searchTokens4Y, searchTokensX]) {
//      magnifying_glass(text="4", height=symbolHeight+1, size=symbolSize, center=true);
//  }
//  
//  
//  // battery tokens
//  holeWithPicture(x=4*wallThickness+3*searchTokensX, y=searchTokenPositionY-batteryTokensY, size=[batteryTokensX, batteryTokensY, batteryTokensHeight]) {
//     battery_symbol(height = symbolHeight+1, size=symbolSize, $line_width=0.3, center=true);
//  } 
//
//
//  // cocroaches
//  //cube()
//  
//  
   } // end difference
//
//
//// fire symbol
//fireSymbolPositionY=fireTokensPositionY+fireTokensY+2+symbolSize/2;
//translate([fireTokensPositionX+fireTokensX/2, fireSymbolPositionY ,topLevel+symbolHeight-0.0002])
//    resize([symbolSize,symbolSize, symbolHeight ])
//    linear_extrude(height=symbolHeight)
//    import(file = "firesymbol.svg", center = true, dpi = 96) ;
//
//// target symbol
//translate([targetTokensPositionX+targetTokensX/2, fireSymbolPositionY ,topLevel-0.1])
//    target_symbol(size=symbolSize, height=symbolHeight+0.1, center=true)
//
//
//// party text
//translate([partyMiddle, partyTokenPositionY+partyTokenY/2+2, topLevel -0.0001 ])
//  linear_extrude(height=symbolHeight+0.0001)
//    text("Party token", halign="center", size=fontSize );
//
//
