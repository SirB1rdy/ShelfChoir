void mouseClicked() {
  tbx1.update(mouseX, mouseY);
}

void mouseDragged() {
  for (int i = 0; i < items.length; i++) {
    if (items[i].isColliding(mouseX, mouseY)) {
      items[i].setDragged(true);
      items[i].update(mouseX, mouseY);
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < items.length; i++) {
    if (items[i].getDragged()) {
      items[i].setDragged(false);
      items[i].setReleased(frameCount);
    }
  }
}
