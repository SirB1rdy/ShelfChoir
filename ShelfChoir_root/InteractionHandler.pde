class InteractionHandler {
  Critter[] critters;
  

  InteractionHandler(Critter[] cs) {
    critters = cs;
  }




  void runInteraction(Interactable item) {
    for (int i = 0; i < critters.length; i++) {
      int[] itemLocation = item.getLocation();
      // checks for each corner of item's square hitbox to see if it's in the hitbox of the critter
      if (critters[i].isColliding(itemLocation[0], itemLocation[1]) ||
        critters[i].isColliding(itemLocation[0] + itemLocation[2], itemLocation[1] + itemLocation[3]) ||
        critters[i].isColliding(itemLocation[0], itemLocation[1] + itemLocation[3]) ||
        critters[i].isColliding(itemLocation[0] + itemLocation[2], itemLocation[1])) {

        log(item.getInteraction() + " interacts with " + critters[i].name);
        if (critters[i].name == "shelf") {
          breakShelf();
        } else {
          // if/else if statements instead of a switch because apparently switch cases don't like full strings smh my head
          if (item.getInteraction() == "Hammer") {
            squishCritter(critters[i]);
          } else if (item.getInteraction() == "Match") {
            burnCritter(critters[i]);
          } else if (item.getInteraction() == "Mic") {
            critterSing(critters[i]);
          } else if (item.getInteraction() == "Feather") {
            tickleCritter(critters[i]);
          } else if (item.getInteraction() == "Tazer") {
            tazeCritter(critters[i]);
          } else {
            log("Unknown interaction");
          }
        }
      }
    }
  }
  
  // tazer-critter interaction
  void tazeCritter(Critter critter) {
    // zappy animation/lightning sprite around the critter
  }
  
  // --- hammer interactions ---
  // hammer-critter
  void squishCritter(Critter critter) {
    // height of the sprite first decreases to a third then goes back up to original
  }
  
  // hammer-shelf
  void breakShelf() {
  
  }
  
  // mic-critter interactions
  void critterSing(Critter critter) {
    // critter sings never gonna give you up
    critter.speak();
  }
  
  // feather-critter interaction
  void tickleCritter(Critter critter) {
    // quick up and down bobbing anymation and changed facial expression
  
  }
  
  // match-critter interaction
  void burnCritter(Critter critter) {
    // critter jumps to a different location
    
  }
  
}
