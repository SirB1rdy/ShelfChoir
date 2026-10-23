// container for interactables
// Toolbox class
class Toolbox {
  int posX = 10;
  int posY = 10;

  boolean opened = false;

  Interactable[] items;

  Toolbox(Interactable[] inI) {
    items = inI;

  }

  Toolbox(int inX, int inY, boolean inO, Interactable[] inI) {
    posX = inX;
    posY = inY;
    opened = inO;
    items = inI;
  }

  void display() {
    fill(#00FF00);
    rect(posX, posY, width/30, width/30);
    if (opened) {
      fill(0);
      rect(posX, posY+width/30+10, width/10, 4*height/5);

      for (int i = 0; i < items.length; i++) {
        if (!items[i].getDragged()) {
          items[i].update(posX+5, posY+width/30+10 +5 +(i+1)*((4*height/5)/(items.length+1)));
        }
        items[i].display();
      }
    }
  }

  void update(int checkX, int checkY) {
    if (buttonCollision(checkX, checkY)) {
      opened = !opened;
      for (int i = 0; i < items.length; i++) {
        items[i].setDragged(false);
        items[i].update(0, 0);
      }
    }
  }



  boolean buttonCollision(int checkX, int checkY) {
    if (checkX > posX && checkX < posX + width/30 && checkY > posY && checkY < posY + width/30) {
      return true;
    } else {
      return false;
    }
  }
}
