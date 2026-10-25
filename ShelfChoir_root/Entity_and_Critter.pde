// Entity class
class Entity {
  int posX;
  int posY;
  int sizeW = 50;
  int sizeH = 50;
  String name = "";
  String interacting = null;

  Entity() { // base constructor
    posX = width/2;
    posY = height/2;
  }

  Entity(String entityName, int entityX, int entityY, int entityW, int entityH) { // full constructor
    name = entityName;
    posX = entityX;
    posY = entityY;
    sizeW = entityW;
    sizeH = entityH;
  }

  void update(int newX, int newY) {
    posX = newX;
    posY = newY;
  }

  void display() {
    fill(#0000FF);
    rect(posX, posY, sizeW, -sizeH); // -sizeH so floor is anchor point, is easier for placement
  }

  int[] getLocation() {
    return new int[] {posX, posY-sizeH, sizeW, sizeH}; // returns posY-sizeH due to how the critter is currently being displayed
  }

  // methods to help with figuring out if an entity is interacting with an item
  String getInteracting() {
    return interacting;
  }

  void setInteracting(String newI) {
    interacting = newI;
  }

  void resetInteracting() {
    interacting = null;
  }
  
  String getEntityName() {
    return name;
  }

  // returns if certain point is within a square hitbox around the item
  boolean isColliding(int checkX, int checkY) {
    if (checkX >= posX && checkX <= posX + sizeW && checkY <= posY && checkY >= posY - sizeH) {
      return true;
    } else {
      return false;
    }
  }
}





// Critter class
class Critter extends Entity {
  SoundFile[] voices = allVoices;
  int voiceIndex = -1;
  int interactStart;

  Critter(String critterName, int critterX, int critterY, int critterW, int critterH, int critterVoice) { // full constructor
    super(critterName, critterX, critterY, critterW, critterH);
    setVoice(critterVoice);
  }
  @Override
    void update(int newX, int newY) {
    if (interacting == null) {
      super.update(newX, newY);
    } else if (interacting == "Match") {
      log("Critter update");
      posX += newX;
      posY += newY;
    }
  }

  void modifySize(int changeW, int changeH) {
    if (interacting == "Hammer") {
      sizeW -= changeW;
      sizeH -= changeH;
    }
  }

  void setStart(int newIS) {// newIS is the new start time of the interaction
    interactStart = newIS;
  }

  int getStart() {
    return interactStart;
  }

  // Critter class voice manager
  void setVoice(int index) {
    if (voices != null && index >= 0 && index < voices.length) {
      voiceIndex = index;
    } else {
      println("Critter " + name + ": voice " + index + " doesn't exist");
    }
  }

  SoundFile getVoice() {
    if (voiceIndex < 0) return null;
    return voices[voiceIndex];
  }

  // plays sound only if the sound file reference is real and if the sound isn't already playing. length of a sound bit: ~36 frames
  void speak() {
    SoundFile v = getVoice();
    if (v != null && !v.isPlaying()) {
      v.play();
    }
  }
  // END Critter class voice manager
}
