import processing.sound.*;

SoundFile[] allVoices; // global voices array
HashMap<String, PImage> allSprites = new HashMap<String, PImage>(); // global sprites, look up by name

void loadAssets() {
  loadVoices();
  loadSprites();
}

void loadVoices() {
  String[] voiceFiles = { // append to add new sprites
    "sounds/voices/voice_01.mp3",
    "sounds/voices/voice_02.mp3",
    "sounds/voices/voice_03.mp3"
  };
  allVoices = new SoundFile[voiceFiles.length];
  for (int i = 0; i < voiceFiles.length; i++) {
    allVoices[i] = new SoundFile(this, voiceFiles[i]);

    boolean fileFound = true;
    try {
      log("" + allVoices[i].frames());
    }
    catch (NullPointerException e) {
      log("Missing voice: " + voiceFiles[i]);
      fileFound = false;
    }

    if (fileFound) {
      log("loaded voice: " + voiceFiles[i]);
    }
  }
}

void loadSprites() { // sprite loader
  // append a name to add a new sprite. The name must match the file name in data/sprites/ (without .png)
  String[] spriteNames = {
    "Cactus",
    "Guy",
    "Mat",
    "Pat",
    "Shelf",
    "Burned_Cactus",
    "Burned_Guy",
    "Burned_Mat",
    "Burned_Pat"
  };

  for (int i = 0; i < spriteNames.length; i++) {
    String path = "sprites/" + spriteNames[i] + ".png";
    PImage img = loadImage(path);
    if (img == null) {
      log("Missing sprite: " + path);
    } else {
      allSprites.put(spriteNames[i], img);
      log("loaded sprite: " + path);
    }
  }
}

// returns the sprite with the given name, or null (with a log message) if it was never loaded
PImage getSprite(String spriteName) {
  PImage img = allSprites.get(spriteName);
  if (img == null) {
    log("No sprite named: " + spriteName);
  }
  return img;
}
