int selectedItem = -1;
boolean swingHammer = false;

InteractionHandler IH;
Toolbox tbx1;
Interactable[] items = new Interactable[3];

Critter[] critters = new Critter[3];


void setup() {
  size(1000, 750);
  loadAssets();
  items[0] = new Interactable("Hammer");
  items[1] = new Interactable("Match");
  items[2] = new Interactable("Mic");

  // cactus: no voice, no song, only reacts to the Match.
  float cactusScale = 0.75;
  critters[0] = new Critter("Cactus", width/5, 3*height/5 + 67, round(spriteSizes.get("Cactus")[0] * cactusScale), round(spriteSizes.get("Cactus")[1] * cactusScale));
  critters[0].setAllowedTools(new String[] {"Match"});

  float critterScale = 0.6;
  critters[1] = new Critter("Pat", 2*width/5, 3*height/5 + 85, round(spriteSizes.get("Pat")[0] * critterScale), round(spriteSizes.get("Pat")[1] * critterScale), 2);
  critters[1].setSong(0); // Pat gets song_1
  critters[2] = new Critter("Mat", 3*width/5, 3*height/5 + 75, round(spriteSizes.get("Mat")[0] * critterScale), round(spriteSizes.get("Mat")[1] * critterScale), 0);
  critters[2].setSong(1); // Mat gets song_2


  IH = new InteractionHandler(critters);
  tbx1 = new Toolbox(10, 10, false, items);
}

void draw() {
  background(#34364F);
  fill(0);
  image(getSprite("Shelf"), width/18, 3*height/5, 8*width/9, spriteSizes.get("Shelf")[1]*0.65);
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
