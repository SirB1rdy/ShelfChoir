void mouseClicked() {
  tbx1.update(mouseX, mouseY);
}

void mouseDragged() {
  if (selectedItem != -1) {
    items[selectedItem].update(mouseX, mouseY);
  }
}

void mousePressed() {
  for (int i = 0; i < items.length; i++) {
    if (items[i].isColliding(mouseX, mouseY) && selectedItem == -1) {
      selectedItem = i;
      items[i].setDragged(true);
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
