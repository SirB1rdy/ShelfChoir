int selectedItem = -1;

InteractionHandler IH;
Toolbox tbx1;
Interactable[] items = {
  new Interactable("Hammer"),
  new Interactable("Match"),
  new Interactable("Mic"),
  new Interactable("Feather"),
  new Interactable("Taser")
};

Critter[] critters = new Critter[2];


void setup() {
  size(1000, 750);
  loadAssets();
  for (int i = 0; i < critters.length; i++) {
    if (i%2 == 0) {
      critters[i] = new Critter("Pat", 200, 380, 30, 35, 2);
    } else {
      critters[i] = new Critter("Mat", 300, 380, 25, 45, 0);
    }
  }
  IH = new InteractionHandler(critters);
  tbx1 = new Toolbox(10, 10, false, items);
}

void draw() {
  background(#34364F);
  updateCritters();
  tbx1.display(mouseX, mouseY);
  IH.runInteraction(items);
}

void updateCritters() {
  for (int i = 0; i < critters.length; i++) {
    //critters[i].update(200, 380); // update location
    critters[i].display();
    //critters[i].speak(); // code disabled
  }
}

// log function for clear debug printing
void log(String toLog) {
  println("[" + frameCount/60 + "s since start | Frame " + frameCount +"] " + toLog);
}
