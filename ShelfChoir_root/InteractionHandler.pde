class InteractionHandler {
  Critter[] critters;


  InteractionHandler(Critter[] cs) {
    critters = cs;
  }

  // method purely for running hammer interaction as this is the only one that happens on release
  void runInteraction(Interactable hammer) {
    for (int i = 0; i < critters.length; i++) {
      int[] itemLocation = hammer.getLocation();
      // checks for each corner of item's square hitbox to see if it's in the hitbox of the critter
      if (critters[i].isColliding(itemLocation[0], itemLocation[1]) ||
        critters[i].isColliding(itemLocation[0] + itemLocation[2], itemLocation[1] + itemLocation[3]) ||
        critters[i].isColliding(itemLocation[0], itemLocation[1] + itemLocation[3]) ||
        critters[i].isColliding(itemLocation[0] + itemLocation[2], itemLocation[1])) {

        log(hammer.getInteraction() + " interacts with " + critters[i].name);
        if (critters[i].getInteracting() == null) {
          critters[i].setInteracting(hammer.getInteraction());
          critters[i].setStart(frameCount);
        }
        
      }
      if (critters[i].getInteracting() == "Hammer") {
          squishCritter(critters[i]);
      }
      
      //if (critters[i].getInteracting() == "Hammer") {

      //}
      //if (critters[i].getEntityName() == "shelf" && critters[i].getInteracting() != null) {
      //      breakShelf();
      //    } else {
    }
  }

  // method for all other interactions aside from hammer
  void runInteraction(Interactable[] items) {
    for (int i = 0; i < critters.length; i++) {
      // if statement to make sure that if a critter started the burning interaction they will not pause after one stops using the match tool
      if (selectedItem == -1) {
        if (critters[i].getInteracting() == "Match") {
          burnCritter(critters[i]);
        }
      } else {
        Interactable item = items[selectedItem];

        int[] itemLocation = item.getLocation();
        // checks for each corner of item's square hitbox to see if it's in the hitbox of the critter
        if (critters[i].isColliding(itemLocation[0], itemLocation[1]) ||
          critters[i].isColliding(itemLocation[0] + itemLocation[2], itemLocation[1] + itemLocation[3]) ||
          critters[i].isColliding(itemLocation[0], itemLocation[1] + itemLocation[3]) ||
          critters[i].isColliding(itemLocation[0] + itemLocation[2], itemLocation[1])) {

          log(item.getInteraction() + " interacts with " + critters[i].name);
          if (critters[i].getInteracting() == null && item.getInteraction() != "Hammer") {
            critters[i].setInteracting(item.getInteraction());
            critters[i].setStart(frameCount);
          }
        }



        // if/else if statements instead of a switch because apparently switch cases don't like full strings smh my head
        if (critters[i].getInteracting() == "Match") {
          burnCritter(critters[i]);
        } else if (critters[i].getInteracting() == "Mic") {
          critterSing(critters[i]);
        } else if (critters[i].getInteracting() == "Feather") {
          tickleCritter(critters[i]);
        } else if (critters[i].getInteracting() == "Taser") {
          taseCritter(critters[i]);
        } else {
          log("Unknown interaction");
        }
      }
    }
  }


  // tazer-critter interaction
  void taseCritter(Critter critter) {
    // zappy animation/lightning sprite around the critter
  }

  // --- hammer interactions ---
  // hammer-critter
  void squishCritter(Critter critter) {
    int animLength = 15; // placeholder value for the length of the jump windup animation
    // height of the sprite first decreases to a third then goes back up to original
    if (frameCount - critter.getStart() == 0) {
      // hammer windup here
    } else if (frameCount - critter.getStart() > animLength) {
      if ((frameCount - critter.getStart() - animLength)/15.0 <= 1) {
        log("Squish");
        critter.modifySize(0, round(2*spriteSizes.get(critter.getEntityName())[1]/3 * 1/15.0));
      } else if ((frameCount - critter.getStart() - animLength)/15.0 > 1 && (frameCount - critter.getStart() - animLength)/15.0 <= 2) {
        log("Unsquish");
        critter.modifySize(0, -1*round(2*spriteSizes.get(critter.name)[1]/3 * 1/15.0));
      } else if ((frameCount - critter.getStart() - animLength)/15.0 > 2) {
        log("Done");
        critter.resetInteracting();
        try {
          items[selectedItem].setDragged(false);
          items[selectedItem].setReleased(frameCount);
        }
        catch (ArrayIndexOutOfBoundsException e) {
          log("Insallah Exception " + e + ", as it was written");
        }
        selectedItem = -1;
        swingHammer = false;
      }
    }
  }

  // hammer-shelf
  void breakShelf() {
  }

  // mic-critter interactions
  void critterSing(Critter critter) {
    // critter sings never gonna give you up

    critter.speak();
    critter.resetInteracting();
  }

  // feather-critter interaction
  void tickleCritter(Critter critter) {
    // quick up and down bobbing animation and changed facial expression
  }

  // match-critter interaction
  void burnCritter(Critter critter) {
    int animLength = 45; // placeholder value for the length of the jump windup animation
    critter.burn(); // change sprites to <"Burned_" + spriteName>
    // critter jumps up and down
    log("" + (frameCount - critter.getStart())/60.0);
    if (frameCount - critter.getStart() == 0) {
      // jump windup animation here
    } else if (frameCount - critter.getStart() > animLength) {
      if ((frameCount - critter.getStart() - animLength)/60.0 <= 1) {
        critter.update(0, -1*round(height/3 * 1/60.0));
      } else if ((frameCount - critter.getStart() - animLength)/60.0 > 1 && (frameCount - critter.getStart() - animLength)/60.0 <= 2) {
        critter.update(0, round(height/3 * 1/60.0));
      } else if ((frameCount - critter.getStart() - animLength)/60.0 > 2) {
        critter.resetInteracting();
      }
    }
  }
}
