int selectedItem = -1;

Toolbox tbx1;
Interactable[] items = {
  new Interactable("Hammer"),
  new Interactable("Match"),
  new Interactable("Mic"),
  new Interactable("Feather"),
  new Interactable("")
};

void setup() {
  size(1000, 750);
  loadAssets();
  tbx1 = new Toolbox(10, 10, false, items);
}

void draw() {
  background(255);
  tbx1.display();
}

void runInteraction(String objectName, String interactableName) {
}
