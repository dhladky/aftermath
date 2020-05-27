use <scad-commons/dice_symbol.scad>;
use <scad-commons/target_symbol.scad>;
use <scad-commons/magnifying_glass.scad>;

boxSizeX = 136;
boxSizeY = 154;
boxSizeHeight = 23; // bottom excluded 
wallThickness=3;
symbolHeight = 1;
symbolSize=6;
fontSize = 3;
fingerHoleRadius = 5; 
fingerHoleExtend = 5; // 

safeTop = boxSizeHeight + 10; // big enough ceiling
topLevel = boxSizeHeight - wallThickness;



// ------------------------------------------------------------


// the other tokens
otherTokensX = 80;
otherTokensY = 55;

otherTokensTop = otherTokensY+wallThickness;

// fire tokens
fireTokensX = 20;
fireTokensY = 13; 

fireTokensPositionX = 2*wallThickness+otherTokensX;
fireTokensPositionY = 2* wallThickness;



// target tokens
targetTokensX = 16;
targetTokensY = 8;

targetTokensPositionX = boxSizeX-2*wallThickness-targetTokensX;
targetTokensPositionY= 2*wallThickness+fireTokensY-targetTokensY;

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


searchTokensFingerHoleX = searchTokensX / 2;

partyTokenPositionY = targetTokensPositionY+symbolSize+15;
partyMiddle = (boxSizeX - wallThickness - otherTokensX)/2+ wallThickness + otherTokensX;

difference(){

translate([0,0,-wallThickness]) {
  cube([boxSizeX, boxSizeY, boxSizeHeight]);
    
  linear_extrude(height=boxSizeHeight)  
  polygon([[wallThickness, 0.0001],[boxSizeX-wallThickness, 0.0001], [boxSizeX-2*wallThickness, -wallThickness], [2*wallThickness, -wallThickness]]) ; 
      
  linear_extrude(height=boxSizeHeight)  
  polygon([[wallThickness, boxSizeY-0.0001],[boxSizeX-wallThickness, boxSizeY-0.0001], [boxSizeX-2*wallThickness, boxSizeY+wallThickness], [2*wallThickness, boxSizeY+wallThickness]]) ; 
  };
  
  // from here token holes
  //---------------------------------
  
  // the other tokens
  translate([wallThickness, wallThickness, 0])
     cube([otherTokensX, otherTokensY, safeTop]);
  
  
  // fire tokens
  fireTokensX = 20;
  fireTokensY = 13; 
  
  fireTokensPositionX = 2*wallThickness+otherTokensX;
  fireTokensPositionY = 2* wallThickness;
  translate([fireTokensPositionX, fireTokensPositionY, topLevel-fireTokensX/2])
     cube([fireTokensX, fireTokensY, safeTop]);
  
  // target tokens
  translate([targetTokensPositionX, targetTokensPositionY , topLevel-targetTokensX/2])
    cube([targetTokensX, targetTokensY, safeTop]);
    
  // party token
  translate([partyMiddle, partyTokenPositionY, safeTop/2+topLevel - partyTokenHeight/2])
    cube([partyTokenX, partyTokenY, safeTop], center = true);  
    
  // dice
  diceX = 34;
  diceY = 17;

  diceBottom=topLevel-diceY/2;
  translate([partyMiddle-diceX/2, otherTokensTop-diceY, diceBottom])
    cube([diceX, diceY, safeTop]);  
    
  translate([partyMiddle, otherTokensTop-diceY/2,diceBottom-symbolHeight])  
     dice_symbol(center=true, line_width=0.5, height = safeTop) ; 
  
  translate([partyMiddle, otherTokensTop-diceY/2,topLevel])
    rotate([0, 90, 0])
     cylinder(h=diceX+fingerHoleExtend*2, r=fingerHoleRadius, center=true);
  
  // search tokens
  //-------------------------------------------------------------------------------
  searchTokenPositionY = otherTokensY + 2*wallThickness + searchTokens2Y;
  searchTokenPositionZ = topLevel-searchTokensX/2;
  
  // tokens 2
  translate([wallThickness, searchTokenPositionY-searchTokens2Y, searchTokenPositionZ])
  cube([searchTokensX, searchTokens2Y, safeTop]);
  
  searchToken2XMiddle = wallThickness+searchTokensX/2;
  translate([searchToken2XMiddle,searchTokenPositionY-searchTokens2Y/2, searchTokenPositionZ-symbolHeight ])
  magnifying_glass(text="2", height=symbolHeight, size=symbolSize+1, center=true);
  
  translate([searchToken2XMiddle, searchTokenPositionY-searchTokens2Y/2, topLevel])
  rotate([90, 0, 0])
     cylinder(h=searchTokens2Y+2*fingerHoleExtend, r=fingerHoleRadius, center=true);
  
  // tokens 3
  translate([2*wallThickness+searchTokensX, searchTokenPositionY-searchTokens3Y, searchTokenPositionZ])
  cube([searchTokensX, searchTokens3Y, safeTop]);
  
  searchToken3XMiddle = 2*wallThickness+searchTokensX*3/2;
  translate([searchToken3XMiddle,searchTokenPositionY-searchTokens3Y/2, searchTokenPositionZ-symbolHeight ])
  magnifying_glass(text="3", height=symbolHeight, size=symbolSize+1, center=true);
  
    translate([searchToken3XMiddle, searchTokenPositionY-searchTokens3Y/2, topLevel])
  rotate([90, 0, 0])
     cylinder(h=searchTokens3Y+2*fingerHoleExtend, r=fingerHoleRadius, center=true);
  
  // tokens 4
  translate([3*wallThickness+2*searchTokensX, searchTokenPositionY-searchTokens4Y, searchTokenPositionZ])
  cube([searchTokensX, searchTokens4Y, safeTop]);
  
  searchToken4XMiddle = 3*wallThickness+searchTokensX*5/2;
  translate([searchToken4XMiddle,searchTokenPositionY-searchTokens4Y/2, searchTokenPositionZ-symbolHeight ])
  magnifying_glass(text="4", height=symbolHeight, size=symbolSize+1, center=true);
  
    translate([searchToken4XMiddle, searchTokenPositionY-searchTokens4Y/2, topLevel])
  rotate([90, 0, 0])
     cylinder(h=searchTokens4Y+2*fingerHoleExtend, r=fingerHoleRadius, center=true);  
  
  // battery tokens
  translate([4*wallThickness+3*searchTokensX, searchTokenPositionY-batteryTokensY, batteryTokensHeight/2])
      cube([batteryTokensX, batteryTokensY, safeTop]);
  
  
  
  
} // end difference


// fire symbol
fireSymbolPositionY=fireTokensPositionY+fireTokensY+2+symbolSize/2;
translate([fireTokensPositionX+fireTokensX/2, fireSymbolPositionY ,topLevel+symbolHeight-0.0002])
    resize([symbolSize,symbolSize, symbolHeight ])
        surface(file="firesymbol.png", center=true, invert=true);

// target symbol
translate([targetTokensPositionX+targetTokensX/2, fireSymbolPositionY ,topLevel-0.1])
    target_symbol(size=symbolSize, height=symbolHeight+0.1, center=true)


// party text
translate([partyMiddle, partyTokenPositionY+partyTokenY/2+2, topLevel -0.0001 ])
  linear_extrude(height=symbolHeight+0.0001)
    text("Party token", halign="center", size=fontSize );






