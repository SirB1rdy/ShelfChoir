# Shelf Choir

> *Why did we torture ourselves like this Fèlix? WHY?*
> *Because it's fun Mika, because it's fun.*
> *You have a really twisted definition of fun.*

**Shelf Choir** is a small interactive toy built in [Processing](https://processing.org/) for a intro to programming university assignment. It recreates a composition we found in a IKEA showroom: two little **DVÄGTALL** figures and a green **ÄRTBUSKE** cactus vase, sitting on a red **LACK** shelf.

Pat, Mat and their trusty cactus live on the shelf. Your job is to pick tools out of a toolbox and do things to them. Some of those things are kind (a microphone), and some of them are not (a hammer, a match).
![Shelf Choir screenshot](docs/image.jpg)

---

## Getting started

### Requirements

- [Processing 4](https://processing.org/download) (Java mode)
- The **Sound** library, which is a dependency. Install it via
  `Sketch → Import Library… → Manage Libraries…`, search for **Sound** (by The Processing Foundation) and click *Install*.

### Run it

```bash
git clone https://github.com/SirB1rdy/ShelfChoir.git
```

1. Open Processing.
2. `File → Open…` and select `ShelfChoir/ShelfChoir_root/ShelfChoir_root.pde`.
3. Press **Run** >.

The sketch opens a 1000 × 750 window. Make sure your speakers are on, because half the fun is audio.

---

## How to play

| Control | What it does |
| --- | --- |
| **Green box** (top left) | Click to open and close the toolbox. Tools animate down to their pick-up point when it opens. |
| **Drag a tool** onto a critter | Makes the two interact. Tools glide back to their spot in the toolbox afterwards. |

A critter that is busy with an interaction can't be interacted with again until it's finished.

### The tools

| Tool | Works on | What happens |
| --- | --- | --- |
| **Hammer** | Pat, Mat | **Release** the hammer over a critter. The hammer animates and squishes it, then returns to the toolbox. |
| **Match** | Pat, Mat, Cactus | **Hold** the match over a critter to burn it. Its look permanently changes to a charred version, and it jumps in shock. (Yes, the cactus can jump. Don't question it.) |
|  **Mic** | Pat, Mat | **Hold** the mic over a critter and it breaks into its own unique song, dancing while it sings. |

### Idle behaviour

When Pat and Mat aren't busy they **chatter** at random, each in their own voice. They stay quiet while singing.
