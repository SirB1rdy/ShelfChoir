// load all sprites, sounds, etc. here

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
    if (allVoices[i] == null) {
      println("Missing voice: " + voiceFiles[i]);
    } else {
      println("loaded voice");
    }
  }
}

void loadSprites() { // sprite loader
  String[] spriteFiles = { // append to add new sprites
    "sprites/1.png",
    "sprites/2.png"
  };
  allSprites = new PImage[spriteFiles.length];
  for (int i = 0; i < spriteFiles.length; i++) {
    allSprites[i] = loadImage(spriteFiles[i]);
    if (allSprites[i] == null) {
      println("Missing sprite: " + spriteFiles[i]);
    } else {
      println("loaded sprite");
    }
  }
}
