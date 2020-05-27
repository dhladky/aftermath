use <dice_symbol.scad>;

boxSizeX = 136;
boxSizeY = 154;
boxSizeHeight = 23; // bottom excluded 
wallThickness=3;
symbolHeight = 1;
fontSize = 3;

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
fireSymbolSize=6;

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

partyTokenPositionY = targetTokensPositionY+fireSymbolSize+15;
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
  
  //todo: díra na prsty
  
} // end difference


// fire symbol
translate([fireTokensPositionX+fireTokensX/2, fireTokensPositionY+fireTokensY+2+fireSymbolSize/2,topLevel+symbolHeight-0.0002])
    resize([fireSymbolSize,fireSymbolSize, symbolHeight ])
        surface(file="firesymbol.png", center=true, invert=true);

// target symbol
targetSymbolSize = fireSymbolSize;
translate([targetTokensPositionX+targetTokensX/2, targetTokensPositionY+targetTokensY+2+targetSymbolSize/2,topLevel+symbolHeight-0.0002])
    resize([targetSymbolSize,targetSymbolSize, symbolHeight ])
        surface(file="targetsymbol.png", center=true, invert=true);


// party text
translate([partyMiddle, partyTokenPositionY+partyTokenY/2+2, topLevel -0.0001 ])
  linear_extrude(height=symbolHeight+0.0001)
    text("Party token", halign="center", size=fontSize );




