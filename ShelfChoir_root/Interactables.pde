// collision
// play sound
// change sprites
// animate

class Interactable {
  int x;
  int y;
  String interaction;
  
  
  Interactable () {
    
  }
  
  void update(int newX, int newY) {
    x = newX;
    y = newY;
  }
  
  void display() {
    fill (#FF0000);
    rect(x, y, 25, 25);
  }
  
  int[] getLocation() {
    return new int[] {x, y};
  }
  
  boolean isTouching(int checkX, int checkY) {
    if (checkX > x && checkX < x + 25 && checkY > y && checkY < y + 25) {
      return true;
    } else {
      return false;
    }
  }
}
