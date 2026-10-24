// container for interactables
// Toolbox class
class Toolbox {
  int posX = 10;
  int posY = 10;

  boolean opened = false;

  Interactable[] items;
  
  
  // bare minimum constructor requires the item array
  Toolbox(Interactable[] inI) {
    items = inI;
  }

  // dev constructor that allows changes to everything
  Toolbox(int inX, int inY, boolean inO, Interactable[] inI) {
    posX = inX;
    posY = inY;
    opened = inO;
    items = inI;
  }



  void display(int checkX, int checkY) {
    // displays different button style based on if it's being hovered on
    if (buttonCollision(checkX, checkY)) {
      fill(#008000);
      rect(posX, posY, width/30, width/30);
    } else {
      fill(#00FF00);
      rect(posX, posY, width/30, width/30);
    }

    if (opened) {
      fill(0);
      rect(posX, posY+width/30+10, width/10, 4*height/5);


      // updates only those not being dragged making them stay in the menu
      for (int i = 0; i < items.length; i++) {
        if (!items[i].getDragged()) {
          items[i].update(posX+5, posY+width/30+10 +5 +(i+1)*((4*height/5)/(items.length+1)));
        }
        items[i].display();
      }
    }
  }

  // handles event on button press to open/close the menu, and sets up the items accordingly
  void update(int checkX, int checkY) {
    if (buttonCollision(checkX, checkY)) {
      opened = !opened;
      for (int i = 0; i < items.length; i++) {
        items[i].setDragged(false);
        items[i].setReleased(frameCount);
        items[i].update(posX+5, posY+width/30+10+5);
      }
    }
  }


  // returns if certain point is within the button hitbox 
  boolean buttonCollision(int checkX, int checkY) {
    if (checkX > posX && checkX < posX + width/30 && checkY > posY && checkY < posY + width/30) {
      return true;
    } else {
      return false;
    }
  }

  int[] getButtonLocation() {
    return new int[] {posX, posY};
  }
  
  // separate from button location for item spawning purposes
  int[] getMenuLocation() {
    return new int[] {posX, posY+width/30+10};
  }
}
