class characterBox {
  String a; //position of character
  String name;
  String lifeSpan;
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
    text (lifeSpan, x + 10, y + 20);
  }

  void setCharacterName (String theName) {
    name = theName;
  }
  
  void setLifeSpan (String birth, String death) {
    lifeSpan = birth + " - " + death;
  }

  void setColour (int theColour) { 
    boxColour = theColour;
  }

  void setPosition (float theX, float theY) {
    x = theX;
    y = theY;
  }
}