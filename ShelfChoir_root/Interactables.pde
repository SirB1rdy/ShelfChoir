// collision
// play sound
// change sprites
// animate

class Interactable {
  int posX;
  int posY;
  String interaction;
  
  
  Interactable () {
    
  }
  
  void update(int newX, int newY) {
    posX = newX;
    posY = newY;
  }
  
  void display() {
    fill (#FF0000);
    rect(posX, posY, 25, 25);
  }
  
  int[] getLocation() {
    return new int[] {posX, posY};
  }
  
  boolean isTouching(int checkX, int checkY) {
    if (checkX > posX && checkX < posX + 25 && checkY > posY && checkY < posY + 25) {
      return true;
    } else {
      return false;
    }
  }
}
