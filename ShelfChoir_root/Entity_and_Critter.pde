class Entity {
  int posX;
  int posY;
  int sizeW = 50;
  int sizeH = 50;
  String name = "";

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
  }
  
  
  
  int[] getLocation() {
    return new int[] {posX, posY};
  }
}
class Critter extends Entity {
  SoundFile[] voices = allVoices;
  int voiceIndex = -1;

  Critter(String critterName, int critterX, int critterY, int critterW, int critterH, SoundFile[] critterVoices, int critterVoice) { // full constructor
    super(critterName, critterX, critterY, critterW, critterH);
    setVoice(critterVoice);
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

  void speak() {
    SoundFile v = getVoice();
    if (v != null && !v.isPlaying()) {
      v.play();
    }
  }
  // END Critter class voice manager
}
