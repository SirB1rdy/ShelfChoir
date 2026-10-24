// collision
// play sound
// change sprites
// animate

// Interactable class
class Interactable {
  String name = "";

  int posX;
  int posY;

  int sizeW = 25;
  int sizeH = 25;

  // field which indicates when item was let go from drag for smoother lerp
  int timeReleased = 0;
  String interaction;
  boolean dragged = false;


  Interactable (String interactableName) {
    name = interactableName;
  }

  void update(int newX, int newY) {
    // when dragged, the parameters are counted as the middle of the item so the position formula reflects that accordingly
    if (dragged) {
      posX = newX - round(sizeW/2);
      posY = newY - round(sizeH/2);

      // if the location being set is the menu location no need for lerping, it just goes there immediately to make opening the menu again smoother
    } else if ((newX == tbx1.getMenuLocation()[0] + 5) && (newY == tbx1.getMenuLocation()[1] + 5)) {
      posX = newX;
      posY = newY;

      // any other case (so just when being drawn in already open menu or being let go from drag) the item smoothly transitions to it's location in the menu
    } else {
      posX = round(lerp(posX, newX, constrain((frameCount-timeReleased)/120.0, 0.0, 1.0)));
      posY = round(lerp(posY, newY, constrain((frameCount-timeReleased)/120.0, 0.0, 1.0)));
    }
  }
  void debugText() {
    fill(#FF0000);
    textAlign(CENTER, TOP);
    textSize(12);
    text(name, posX + sizeW, posY - 15); // position it top right of box
  }

  void display() {
    fill (#FF0000);
    rect(posX, posY, sizeW, sizeH);
    debugText(); // render text with interactable object's name
  }



  void setDragged(boolean newD) {
    dragged = newD;
  }

  boolean getDragged() {
    return dragged;
  }

  void setReleased(int newR) {
    timeReleased = newR;
  }

  int[] getLocation() {
    return new int[] {posX, posY, sizeW, sizeH};
  }



  // returns if certain point is within a square hitbox around the item
  boolean isColliding(int checkX, int checkY) {
    if (checkX >= posX && checkX <= posX + sizeW && checkY >= posY && checkY <= posY + sizeH) {
      return true;
    } else {
      return false;
    }
  }
}
