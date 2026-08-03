# Flappy Bird Clone - Godot 4.x

A simple Flappy Bird style game built with Godot Engine 4.x.

## Project Structure

```
/workspace
├── project.godot          # Project configuration
├── scenes/
│   ├── main.tscn          # Main game scene
│   ├── bird.tscn          # Bird player scene
│   └── pipe.tscn          # Pipe obstacle scene
├── scripts/
│   ├── main.gd            # Main game logic (spawning, scoring)
│   ├── bird.gd            # Bird physics and controls
│   └── pipe.gd            # Pipe movement and collision
└── assets/                # For custom sprites (optional)
```

## How to Play

1. **Open in Godot**: Import this project folder into Godot Engine 4.x
2. **Run**: Press F5 or click the Play button
3. **Controls**: 
   - Press SPACE or Left Mouse Button to make the bird jump
   - Avoid hitting the pipes
   - Don't fall off the screen

## Features

- Simple physics-based bird movement
- Randomly generated pipes
- Score tracking
- Game over detection
- Restart functionality

## Customization

You can modify these values in the Godot editor:

**Bird** (`bird.gd`):
- `jump_strength`: How high the bird jumps (default: -300)
- `gravity`: How fast the bird falls (default: 980)

**Pipe** (`pipe.gd`):
- `speed`: How fast pipes move left (default: 200)
- `pipe_gap`: Gap between top and bottom pipes (default: 150)

**Main** (`main.gd`):
- `spawn_timer`: Time between pipe spawns (default: 1.5 seconds)

## Adding Custom Sprites

To replace the colored rectangles with actual sprites:

1. Add your sprite images to the `assets/` folder
2. Open each scene file in Godot
3. Select the Sprite2D nodes
4. Assign your texture in the Inspector panel
