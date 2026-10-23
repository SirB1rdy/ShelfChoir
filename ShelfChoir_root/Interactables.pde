// collision
// play sound
// change sprites
// animate

class Interactable {
  int posX;
  int posY;


  int sizeW = 25;
  int sizeH = 25;

  int timeReleased = 0;
  String interaction;
  boolean dragged = false;


  Interactable () {
  }

  void update(int newX, int newY) {
    if (dragged) {
      posX = newX - round(sizeW/2);
      posY = newY - round(sizeH/2);
    } else {
      posX = round(lerp(posX, newX, constrain((frameCount-timeReleased)/120.0, 0.0, 1.0)));
      posY = round(lerp(posY, newY, constrain((frameCount-timeReleased)/120.0, 0.0, 1.0)));
    }
  }

  void display() {
    fill (#FF0000);
    rect(posX, posY, sizeW, sizeH);
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
    return new int[] {posX, posY};
  }




  // this method is primarily for handling if the interactable is touching an item, NOT for touching user mouse
  boolean isColliding(int checkX, int checkY) {
    if (checkX >= posX && checkX <= posX + sizeW && checkY >= posY && checkY <= posY + sizeH) {
      return true;
    } else {
      return false;
    }
  }
}



// this method is primarily for handling touching user mouse, NOT for if the interactable is touching an item
//int touchingInteractable() {
//  boolean[] touchingIndex = new boolean[items.length]; // start with an array of all items we are touching with the mouse, from which we pick the last element that we are actually touching (always topmost one)

//  for (int i = 0; i < items.length; i++) {
//    if (checkX > posX && checkX < posX + 25 && checkY > posY && checkY < posY + 25) { //Look if dist mouse to bird body <= 0
//      touchingIndex[i] = true;
//    }
//  }
//  for (int i = touchingIndex.length - 1; i >= 0; i--) {
//    if (touchingIndex[i]) {
//      return Objects.name;
//    }
//  }
//  return -1;
//}
