import processing.sound.*;
import java.util.Map;

SoundFile[] allVoices; // global voices array
PImage[] allSprites; // global sprites array
HashMap<String, int[]> spriteSizes = new HashMap<String, int[]>(); // global to the default sizes of each sprite

void loadAssets() {
  loadVoices();
  loadSprites();
}

void loadVoices() {
  String[] voiceFiles = { // append to add new sprites
    "sounds/voices/voice_01.mp3",
    "sounds/voices/voice_02.mp3",
    "sounds/voices/voice_03.mp3",
    "sounds/voices/voice_04.mp3"
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
      println("loaded sprite: " + spriteFiles[i]);
    }
  }
  // sprite size loader
  String[] lines = loadStrings("sprites/size guide.txt");
  for (int i = 0; i < lines.length - 2; i++) { 
    int[] size = {int(splitTokens(lines[i], ". =,")[2]), int(splitTokens(lines[i], ". =,")[3])};
    spriteSizes.put(splitTokens(lines[i], ". =,")[0], size);
  }
}
