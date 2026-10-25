class InteractionHandler {
  Critter[] critters;


  InteractionHandler(Critter[] cs) {
    critters = cs;
  }




  void runInteraction(Interactable[] items) {
    for (int i = 0; i < critters.length; i++) {
      // if statement to make sure that if a critter started the burning interaction they will not pause after one stops using the match tool
      if (selectedItem == -1) {
        if (critters[i].getInteracting() == "Match" && critters[i].getInteracting() != null) {
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
          if (critters[i].getInteracting() == null) {
            critters[i].setInteracting(item.getInteraction());
            critters[i].setStart(frameCount);
          }
        }

        if (critters[i].name == "shelf" && critters[i].getInteracting() != null) {
          breakShelf();
        } else {

          // if/else if statements instead of a switch because apparently switch cases don't like full strings smh my head
          if (critters[i].getInteracting() == "Hammer" && critters[i].getInteracting() != null) {
            squishCritter(critters[i]);
          } else if (critters[i].getInteracting() == "Match" && critters[i].getInteracting() != null) {
            burnCritter(critters[i]);
          } else if (critters[i].getInteracting() == "Mic" && critters[i].getInteracting() != null) {
            critterSing(critters[i]);
          } else if (critters[i].getInteracting() == "Feather" && critters[i].getInteracting() != null) {
            tickleCritter(critters[i]);
          } else if (critters[i].getInteracting() == "Tazer" && critters[i].getInteracting() != null) {
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
    critter.resetInteracting();
  }

  // feather-critter interaction
  void tickleCritter(Critter critter) {
    // quick up and down bobbing animation and changed facial expression
  }

  // match-critter interaction
  void burnCritter(Critter critter) {
    log("Burn start");
    int animLength = 45; // placeholder value for the length of the jump windup animation
    // critter jumps up and down
    log("" + (frameCount - critter.getStart())/60.0);
    if (frameCount - critter.getStart() == 0) {
      // jump windup animation here
      log("Windup");
    } else if (frameCount - critter.getStart() > animLength) {
      if ((frameCount - critter.getStart() - animLength)/60.0 <= 1) {
        log("Up");
        critter.update(0, -1*round(height/3 * 1/60.0));
      } else if ((frameCount - critter.getStart() - animLength)/60.0 > 1 && (frameCount - critter.getStart() - animLength)/60.0 <= 2) {
        log("Down");
        critter.update(0, round(height/3 * 1/60.0));
      } else if ((frameCount - critter.getStart() - animLength)/60.0 > 2) {
        critter.resetInteracting();
      }
    }
  }
}
