void mouseClicked() {
  tbx1.update(mouseX, mouseY);
}

void mouseDragged() { //-- mouse cursor can escape bounding box for drag: GitHub issue #9
  for (int i = 0; i < items.length; i++) {
    if (items[i].isColliding(mouseX, mouseY)) {
      if (selectedItem == -1 || selectedItem == i) {
        items[i].setDragged(true);
        items[i].update(mouseX, mouseY);
        selectedItem = i;
      }
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < items.length; i++) {
    if (items[i].getDragged()) {
      items[i].setDragged(false);
      items[i].setReleased(frameCount);
      selectedItem = -1;
    }
  }
}
