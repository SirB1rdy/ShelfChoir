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
        log("Swing");
        swingHammer = true;
        IH.runInteraction(items[i]);
      } else {
        items[i].setDragged(false);
        items[i].setReleased(frameCount);
        selectedItem = -1;
      }
    }
  }
}
