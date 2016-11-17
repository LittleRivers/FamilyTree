import controlP5.*;
ControlP5 cp5;

DropdownList race, sex;
Textfield firstName, lastName, DoB, DoD;
CheckBox override, family;

characterBox mainCharacter = new characterBox();
characterBox [] characters = new characterBox [1];

String [] races = {"Random", "Mountains", "Fields", "Forests", "Air", "Water", "Fire"};
Table femaleNames;
Table maleNames;
Table lastNames;
Table deathProbability;
TableRow r;

color maleBox = color (172, 172, 236);
color femaleBox = color (236, 172, 172);
boolean ancestors =  false;
boolean descendants = false;
boolean generate = false;
boolean overrideState = false;


void setup () {
  cp5 = new ControlP5(this);

  size (600, 400);

  family = cp5.addCheckBox("Family")
    .setPosition (30, 80)
    .setSize(20, 20)
    .addItem ("Ancestors", 1)
    .addItem ("Descendants", 2);

  race = cp5.addDropdownList("Race")
    .setPosition (30, 30)
    .setBarHeight (20)
    .setWidth (60)
    .addItems (races)
    .close();

  sex = cp5.addDropdownList("Sex")
    .setPosition (100, 30)
    .setBarHeight (20)
    .setWidth (50)
    .addItem ("Random", 0)
    .addItem ("Male", 1)
    .addItem ("Female", 2)
    .close();

  firstName = cp5.addTextfield("First Name")
    .setPosition (160, 30)
    .setSize (70, 20);

  lastName = cp5.addTextfield("Last Name")
    .setPosition (240, 30)
    .setSize (70, 20);

  DoB = cp5.addTextfield("Date of Birth")
    .setPosition (320, 30)
    .setSize (60, 20);

  DoD = cp5.addTextfield("Date of Death")
    .setPosition (485, 30)
    .setSize (60, 20)
    .hide();

  override = cp5.addCheckBox("Override")
    .setPosition (390, 30)
    .setSize(20, 20)
    .addItem ("override death", 1);

  cp5.addBang("Generate")
    .setPosition (160, 90)
    .setSize (50, 20);

  femaleNames = loadTable ("FemaleNames.csv", "header");
  maleNames = loadTable ("MaleNames.csv", "header");
  lastNames = loadTable ("LastNames.csv", "header");
  deathProbability = loadTable ("DeathProbability.csv", "header");
} 

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(override)) {
    overrideState = override.getState("override death");
    if (overrideState == true) {
      cp5.get(Textfield.class, "Date of Death").show();
    } else {
      cp5.get(Textfield.class, "Date of Death").hide();
    }
  }
}

void Generate () {
  mainCharacter.setCharacterName(firstName.getText() + " " + lastName.getText());
  println("Name: " + mainCharacter.name);

  float gender = sex.getValue();
  if (gender == 1) {
    mainCharacter.setColour(maleBox);
  } 
  if (gender == 2) {
    mainCharacter.setColour(femaleBox);
  } 

  if (overrideState == false) {
    int maleRow = deathProbability.getRowCount() - 1;
    int femaleRow = deathProbability.getRowCount();
    if (gender == 1) {
      r = deathProbability.getRow(maleRow);
    }
    if (gender == 2) {
      r= deathProbability.getRow(femaleRow);
    }
    boolean i = false;
    while (i == false) {
      float randomNumber = random (100000);
      println ("random = " + randomNumber);
      for (int age = 0; age < r.getColumnCount(); age++) {
        println ("age = " + age);
        float prob = r.getFloat(age);
        println ("probability = " +prob);
        if (prob >= randomNumber) {
          i = true;
          int birth = Integer.parseInt(DoB.getText());
          println(birth);
          String death = str(birth + age);
          println (death);
          mainCharacter.setLifeSpan(DoB.getText(), death, age);
          break;
        }
      }
    }
  } else {
    mainCharacter.setLifeSpan(DoB.getText(), DoD.getText(), Integer.parseInt(DoD.getText()) - Integer.parseInt(DoB.getText()));
  }


  ancestors = family.getState("Ancestors");
  descendants = family.getState("Descendants");
  if (ancestors == true && descendants == true) {
    mainCharacter.setPosition(width/2 - 50, 140);
  } else if (ancestors == true) {
    mainCharacter.setPosition(width - 30 - 100, 140);
  } else if (descendants == true) {
    mainCharacter.setPosition(30, 140);
  }
  generate = true;
}

void draw() {
  background (0);

  if (generate == true) {
    if (ancestors != false|| descendants != false) {
      mainCharacter.addBox();
    }
  }
}

void mouseClicked () {
  println ("x = " + mouseX);
  println ("y = " + mouseY);
}