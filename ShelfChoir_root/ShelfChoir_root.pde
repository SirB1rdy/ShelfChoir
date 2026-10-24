int selectedItem = -1;

Toolbox tbx1;
Interactable[] items = {new Interactable(), new Interactable(), new Interactable(), new Interactable(), new Interactable()};

void setup() {
  size(1000, 750);
  loadAssets();
  tbx1 = new Toolbox(10, 10, false, items);
}

void draw() {
  background(255);
  tbx1.display(mouseX, mouseY);
}

void runInteraction(String objectName, String interactableName) {
  
}
