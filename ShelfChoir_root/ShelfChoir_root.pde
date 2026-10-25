int selectedItem = -1;
boolean swingHammer = false;

InteractionHandler IH;
Toolbox tbx1;
Interactable[] items = {
  new Interactable("Hammer"),
  new Interactable("Match"),
  new Interactable("Mic"),
  new Interactable("Feather"),
  new Interactable("Taser")
};

Critter[] critters = new Critter[3];


void setup() {
  size(1000, 750);
  loadAssets();
    critters[0] = new Critter("Pat", 100, 380, spriteSizes.get("Pat")[0], spriteSizes.get("Pat")[1], 2);
  critters[0].setSong(0); // Pat gets song_1
  critters[1] = new Critter("Mat", 500, 380, spriteSizes.get("Mat")[0], spriteSizes.get("Mat")[1], 0);
  critters[1].setSong(1); // Mat gets song_2
 
  // cactus: no voice, no song, only reacts to the Match.
  float cactusScale = 0.25;
  critters[2] = new Critter("Cactus", 750, 380, round(spriteSizes.get("Cactus")[0] * cactusScale), round(spriteSizes.get("Cactus")[1] * cactusScale));
  critters[2].setAllowedTools(new String[] {"Match"});
  
  IH = new InteractionHandler(critters);
  tbx1 = new Toolbox(10, 10, false, items);
}

void draw() {
  background(#34364F);
  updateCritters();
  tbx1.display(mouseX, mouseY);
  IH.runInteraction(items);
  if (swingHammer) {
    for (int i = 0; i < items.length; i++) {
      if (items[i].getInteraction() == "Hammer") {
        IH.runInteraction(items[i]);
      }
    }
  }
}

/// Custom Methods

void updateCritters() {
  for (int i = 0; i < critters.length; i++) {
    //critters[i].update(0,0);
    critters[i].display();
    critters[i].chatter();
  }
}

// log function for clear debug printing
void log(String toLog) {
  println("[" + frameCount/60 + "s since start | Frame " + frameCount +"] " + toLog);
}
