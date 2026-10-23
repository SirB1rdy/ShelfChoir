// load all sprites, sounds, etc. here

import processing.sound.*;

SoundFile[] allVoices; // global voices array

void loadAssets() {
  allVoices = new SoundFile[] {
    new SoundFile(this, ""),
    new SoundFile(this, ""),
    new SoundFile(this, "")
  };
}
