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
    int trim = 10;
    fill(#0000FF);
    rect(posX-(trim/2), posY-(trim/2), sizeW+trim, -sizeH); // -sizeH so floor is anchor point, is easier for placement
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
  ///get files for critters
  SoundFile[] voices = allVoices;
  int voiceIndex = -1;
  int interactStart;

  // sprites, looked up by critter name
  PImage normalSprite;
  PImage burnedSprite;
  PImage currentSprite; // the drawn/selected sprite

  // songs (one per critter) that play while the Mic is used on them
  SoundFile[] songs = allSongs;
  int songIndex = -1;
  boolean singing = false;
  ///

  int drawOffsetY = 0;
  float drawAngle = 0;

  Critter(String critterName, int critterX, int critterY, int critterW, int critterH, int critterVoice) { // full constructor
    super(critterName, critterX, critterY, critterW, critterH);
    setVoice(critterVoice);
    normalSprite = getSprite(critterName);
    burnedSprite = getSprite("Burned_" + critterName);
    currentSprite = normalSprite; // always start on normal sprite
  }
  // draws critter, falls back to placeholder if failed to load
  @Override
    void display() {
    //super.display(); // uncomment to see hitbox
    // draw around the bottom middle of the critter so any rotation pivots on its feet
    pushMatrix();
    translate(posX + sizeW/2, posY + drawOffsetY);
    rotate(drawAngle);
    image(currentSprite, -sizeW/2, -sizeH, sizeW, sizeH);
    popMatrix();
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

  // Chatter method
  void chatter() {
    if (interacting == null && !singing && random(500) < 1) {
      speak();
      log("chatter " + name);
    }
  }

  // switches the critter to its burned sprite (stays burned)
  void burn() {
    if (burnedSprite != null) {
      currentSprite = burnedSprite;
    }
  }

  void modifySize(int changeW, int changeH) {
    if (interacting == "Hammer") {
      sizeW -= changeW;
      sizeH -= changeH;
    }
  }

  // set sway for animation
  void setSway(int offsetY, float angle) {
    drawOffsetY = offsetY;
    drawAngle = angle;
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

  // Critter class song manager
  void setSong(int index) {
    if (songs != null && index >= 0 && index < songs.length) {
      songIndex = index;
    } else {
      println("Critter " + name + ": song " + index + " doesn't exist");
    }
  }

  SoundFile getSong() {
    if (songIndex < 0) return null;
    return songs[songIndex];
  }

  // length of the song in seconds, 0 if there is no song
  float getSongDuration() {
    SoundFile s = getSong();
    if (s == null) return 0;
    return s.duration();
  }

  void startSong() {
    SoundFile s = getSong();
    if (s != null) {
      s.play();
      singing = true;
    }
  }

  boolean isSinging() {
    return singing;
  }

  // ends the singing interaction and puts the sprite back in its normal pose
  void stopSinging() {
    singing = false;
    setSway(0, 0);
    resetInteracting();
  }
  // END Critter class song manager
}
