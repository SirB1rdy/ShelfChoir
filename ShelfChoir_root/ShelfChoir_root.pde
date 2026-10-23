Toolbox tbx1;
Toolbox tbx2;
Interactable[] items = {new Interactable(), new Interactable(), new Interactable()};

void setup() {
  size(1000, 750);
  tbx1 = new Toolbox(10, 10, false, items);
  tbx2 = new Toolbox(100, 10, true, items);
}

void draw() {
  tbx1.display();
  tbx2.display();
}
