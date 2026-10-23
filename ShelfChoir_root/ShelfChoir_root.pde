Toolbox tbx1;
Interactable[] items = {new Interactable(), new Interactable(), new Interactable()};

void setup() {
  size(1000, 750);
  tbx1 = new Toolbox(10, 10, false, items);
}

void draw() {
  background(255);
  tbx1.display();
}

void runInteraction(String objectName, String interactableName) {
}
