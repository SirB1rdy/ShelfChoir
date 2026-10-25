void mouseClicked() {
  tbx1.update(mouseX, mouseY);
}

// drags only the item which is currently selected
void mouseDragged() {
  if (selectedItem != -1) {
    items[selectedItem].update(mouseX, mouseY);
  }
}

// on mouse press any item being hovered on becomes selected to drag
void mousePressed() {
  for (int i = 0; i < items.length; i++) {
    if (items[i].isColliding(mouseX, mouseY) && selectedItem == -1) {
      selectedItem = i;
      items[i].setDragged(true);
    }
  }
}

// on mouse release if the program finds any dragged item it unselects it
void mouseReleased() {
  for (int i = 0; i < items.length; i++) {
    if (items[i].getDragged()) {
      if (items[i].getInteraction() == "Hammer") {
        for (int j = 0; j < critters.length; j++) {
          int[] itemLocation = items[i].getLocation();
          // checks for each corner of item's square hitbox to see if it's in the hitbox of the critter
          if (critters[j].isColliding(itemLocation[0], itemLocation[1]) ||
            critters[j].isColliding(itemLocation[0] + itemLocation[2], itemLocation[1] + itemLocation[3]) ||
            critters[j].isColliding(itemLocation[0], itemLocation[1] + itemLocation[3]) ||
            critters[j].isColliding(itemLocation[0] + itemLocation[2], itemLocation[1])) {
            log("Swing");
            swingHammer = true;
            IH.runInteraction(items[i]);
          } else {
            log("my ammar missed :(");
            critters[j].resetInteracting();
            items[i].setDragged(false);
            items[i].setReleased(frameCount);
            selectedItem = -1;
            swingHammer = false;
          }
        }

      } else {
        items[i].setDragged(false);
        items[i].setReleased(frameCount);
        selectedItem = -1;
      }
    }
  }
}
