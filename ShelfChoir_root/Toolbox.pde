// container for tools
class Toolbox {
  int x = 10;
  int y = 10;

  boolean opened = false;

  Interactable[] items;

  Toolbox(Interactable[] inI) {
    items = inI;
  }
  
  Toolbox(int inX, int inY, boolean inO, Interactable[] inI) {
    x = inX;
    y = inY;
    opened = inO;
    items = inI;
  }

  void display() {
    fill(#00FF00);
    rect(x, y, width/30, width/30);
    if (opened) {
      fill(0);
      rect(x, y+width/30+10, width/10, 3*height/5);
      
      for (int i = 0; i < items.length; i++) {
        items[i].display(x+5, y+width/30+10 +5 +(i+1)*((3*height/5)/(items.length+1)));
      }
    }
  }
  
  boolean buttonDetection() {}
  
}
