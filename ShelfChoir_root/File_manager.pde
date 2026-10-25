import processing.sound.*;
import java.util.Map;

SoundFile[] allVoices; // global voices array
SoundFile[] allSongs; // global songs array

HashMap<String, PImage> allSprites = new HashMap<String, PImage>(); // global sprites, look up by name
HashMap<String, int[]> spriteSizes = new HashMap<String, int[]>(); // global to the default sizes of each sprite

void loadAssets() {
  loadVoices();
  loadSprites();
  loadSongs();
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
  String[] spriteNames = {
    "Cactus",
    "Guy",
    "Mat",
    "Pat",
    "Shelf",
    "Burned_Cactus",
    "Burned_Guy", // loaded and forgotten R.I.P
    "Burned_Mat",
    "Burned_Pat",
    "Hammer",
    "Mic",
    "Match"
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
  // sprite size loader
  String[] lines = loadStrings("sprites/size guide.txt");
  for (int i = 0; i < lines.length - 2; i++) { 
    int[] size = {int(splitTokens(lines[i], ". =,")[2]), int(splitTokens(lines[i], ". =,")[3])};
    spriteSizes.put(splitTokens(lines[i], ". =,")[0], size);
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

void loadSongs() {
  String[] songFiles = { // append to add new songs
    "sounds/effects/song_01.mp3",
    "sounds/effects/song_02.mp3"
  };
  allSongs = new SoundFile[songFiles.length];
  for (int i = 0; i < songFiles.length; i++) {
    allSongs[i] = new SoundFile(this, songFiles[i]);
    log("loaded song: " + songFiles[i]);
  }
}
