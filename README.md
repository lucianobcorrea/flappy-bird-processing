# Flappy Bird in Processing

This project is a simple clone of the classic **Flappy Bird** game written in the [Processing](https://processing.org/) environment.

## Requirements

- **Processing** (tested with the latest versions of Processing 3/4)

Make sure Processing is installed and the `processing-java` command or the Processing IDE is available on your system.

## Running the game

1. Clone or download this repository.
2. Open the project folder (`flappy-bird-processing`) in the Processing IDE or run the main sketch with `processing-java`.
   - The entry point is `FlappyBird.pde` (also listed in `sketch.properties`).

To run from the command line with `processing-java`:

```bash
processing-java --sketch=/path/to/flappy-bird-processing --run
```

Alternatively, open `FlappyBird.pde` in the Processing IDE and press `Run`.

## Assets

The `assets` directory contains the images used by the sketch:

- `bg.jpg` – background image
- `bird.png` – sprite for the player
- `pillarTop.png` and `pillarBotton.png` – sprites for the obstacles

Ensure these files remain in the `assets` folder so that the sketch can load them correctly.

