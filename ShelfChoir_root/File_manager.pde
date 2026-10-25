import processing.sound.*;

SoundFile[] allVoices; // global voices array
PImage[] allSprites; // global sprites array

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
    } catch (NullPointerException e) {
      log("Missing voice: " + voiceFiles[i]);
      fileFound = false;
    } 
    
    if (fileFound) {
      log("loaded voice: " + voiceFiles[i]);
    }
  }
}

void loadSprites() { // sprite loader
  String[] spriteFiles = { // append to add new sprites
    "sprites/Shelf.png",
    "sprites/Pat.png",
    "sprites/Mat.png",
    "sprites/Guy.png",
    "sprites/Cactus.png",
    "sprites/Burned_Pat.png",
    "sprites/Burned_Mat.png",
    "sprites/Burned_Guy.png",
    "sprites/Burned_Cactus.png"
  };
  allSprites = new PImage[spriteFiles.length];
  for (int i = 0; i < spriteFiles.length; i++) {
    allSprites[i] = loadImage(spriteFiles[i]);
    if (allSprites[i] == null) {
      println("Missing sprite: " + spriteFiles[i]);
    } else {
      println("loaded sprite: " + spriteFiles[i]);
    }
  }
}
