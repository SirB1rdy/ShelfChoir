int selectedItem = -1;

Toolbox tbx1;
Interactable[] items = {
  new Interactable("Hammer"),
  new Interactable("Match"),
  new Interactable("Mic"),
  new Interactable("Feather"),
  new Interactable("")
};

Critter[] critters = {
  new Critter("Pat", 200, 380, 30, 35, 2),
  new Critter("Mat", 250, 380, 25, 45, 0)
};

void setup() {
  size(1000, 750);
  loadAssets();
  tbx1 = new Toolbox(10, 10, false, items);
}

void draw() {
  background(255);
  tbx1.display(mouseX, mouseY);
  updateCritters();
}

void runInteraction(String objectName, String interactableName) {
  
}

void updateCritters() {
  for (int i = 0; i < critters.length; i++){
    //critters[i].update(200, 380);
    critters[i].display();
  }
}
