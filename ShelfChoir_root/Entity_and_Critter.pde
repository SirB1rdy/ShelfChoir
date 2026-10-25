// Entity class
class Entity {
  int posX;
  int posY;
  int sizeW = 50;
  int sizeH = 50;
  int trim = 10;

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
    if (checkX >= posX-(trim/2) && checkX <= posX + sizeW + trim && checkY <= posY && checkY >= posY-(trim/2) - sizeH) {
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

  boolean hasVoice = true; // false for voiceless critters (the cactus), they never chatter
  String[] allowedTools = null; // null = reacts to every tool, otherwise only to the tools listed here

  int drawOffsetY = 0;
  float drawAngle = 0;

  Critter(String critterName, int critterX, int critterY, int critterW, int critterH, int critterVoice) { // full constructor
    super(critterName, critterX, critterY, critterW, critterH);
    setVoice(critterVoice);
    normalSprite = getSprite(critterName);
    burnedSprite = getSprite("Burned_" + critterName);
    currentSprite = normalSprite; // always start on normal sprite
  }

  // voiceless constructor (cactus)
  Critter(String critterName, int critterX, int critterY, int critterW, int critterH) {
    this(critterName, critterX, critterY, critterW, critterH, -1);
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
    if (hasVoice && interacting == null && !singing && random(500) < 1) {
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

  /// Which tools can I use-inator
  // limits which tools this critter reacts to, e.g. setAllowedTools(new String[] {"Match"})
  void setAllowedTools(String[] tools) {
    allowedTools = tools;
  }

  // true if this critter reacts to the given tool
  boolean canInteractWith(String tool) {
    if (allowedTools == null) return true;
    for (int i = 0; i < allowedTools.length; i++) {
      if (allowedTools[i].equals(tool)) return true;
    }
    return false;
  }
  ///

  void setStart(int newIS) {// newIS is the new start time of the interaction
    interactStart = newIS;
  }

  int getStart() {
    return interactStart;
  }

  // Critter class voice manager
  void setVoice(int index) {
    if (index < 0) { // -1 means "no voice", not an error
      voiceIndex = -1;
      hasVoice = false;
      return;
    }
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
