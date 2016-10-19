class characterBox {
  String a; //position of character
  String name;
  color boxColour; 
  float x, y;


  characterBox () {
  }

  void  addBox() {
    noStroke();
    fill(boxColour);
    rect (x, y, 100, 80);
    fill (0);
    text (name, x + 10, y + 10);
  }

  void setCharacterName (String theName) {
    name = theName;
  }

  void setColour (int theColour) { 
    boxColour = theColour;
  }

  void setPosition (float theX, float theY) {
    x = theX;
    y = theY;
  }
}