class InteractionHandler {
  Critter[] critters;

  InteractionHandler(Critter[] cs) {
    critters = cs;
  }




  void runInteraction(Interactable item) {
    for (int i = 0; i < critters.length; i++) {
      int[] itemLocation = item.getLocation();
      // checks for each corner of item's square hitbox to see if it's in the hitbox of the critter
      if (critters[i].isColliding(itemLocation[0], itemLocation[1]) || critters[i].isColliding(itemLocation[0] + itemLocation[2], itemLocation[1] + itemLocation[3]) || critters[i].isColliding(itemLocation[0], itemLocation[1] + itemLocation[3]) || critters[i].isColliding(itemLocation[0] + itemLocation[2], itemLocation[1])){
        log(item.getInteraction() + " interacts with " + critters[i].name);
        critters[i].speak();
      }
    }
  }
}
