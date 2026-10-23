String touchedCreature(int r) {
  int radius = r;
  boolean[] touchingIndex = new boolean[aliveBirds];
  for (int i = 0; i < aliveBirds; i++) {
    if (dist(birds[i].CreatureX, birds[i].CreatureY, mousePosX, mousePosY) <= radius) { //Look if dist mouse to bird body <= 0
      touchingIndex[i] = true;
    }
  }
  for (int i = touchingIndex.length - 1; i >= 0; i--) {
    if (touchingIndex[i]) {
      return Objects.name;
    }
  }
  return -1;
}

//unfinished
