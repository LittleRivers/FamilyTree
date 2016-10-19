import controlP5.*;
ControlP5 cp5;

DropdownList race, sex;
Textfield firstName;
Textfield lastName;
Textfield DoB;
Textfield DoD;
CheckBox override;
CheckBox ancestors;
CheckBox descendants;

String [] sexes = {"male", "female", "random"};

void setup () {
  size (700, 400);

  race = new JComboBox(sexes);
  
  
}