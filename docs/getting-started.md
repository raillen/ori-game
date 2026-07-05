# Getting Started with ori-game

This guide will help you get started with the ori-game engine for building 2D games in Ori.

## Installation

### Prerequisites

- Ori compiler (latest version)
- Raylib libraries for your platform

### Adding ori-game to Your Project

1. Create a new Ori project:
   ```bash
   ori new my_game
   cd my_game
   ```

2. Add ori-game dependency to `ori.pkg.toml`:
   ```toml
   [package]
   name = "my_game"
   version = "0.1.0"

   [dependencies]
   ori-game = "0.1.0"
   ```

3. Install the package:
   ```bash
   ori install
   ```

## Basic Structure

A typical ori-game project looks like this:

```
my_game/
├── ori.pkg.toml
├── main.orl
└── lib/
    └── raylib.lib (or .so/.dylib)
```

## Creating Your First Game

### 1. Hello World

Create `main.orl`:

```ori
import ori.game as game
import ori.game.engine as engine
import ori.game.input as input
import ori.game.draw as draw
import ori.game.color as color
import ori.math.vec2 as vec2

func main()
    game.run_game("Hello World", 800, 600,
        update = do(dt: float) => end,
        draw = do() =>
            draw.draw_text("Hello, Ori!", vec2.Vec2(x: 300.0, y: 280.0), 40, color.WHITE)
        end
    )
end
```

### 2. Adding a Player

```ori
struct Player
    pos: vec2.Vec2
    speed: float = 200.0
end

var player: Player = nil

func init() -> void
    player = Player(pos: vec2.Vec2(x: 400.0, y: 300.0))
end

func update(dt: float) -> void
    -- Movement
    if input.key_down(39)  -- RIGHT
        player.pos.x = player.pos.x + player.speed * dt
    end
    if input.key_down(37)  -- LEFT
        player.pos.x = player.pos.x - player.speed * dt
    end
    if input.key_down(40)  -- DOWN
        player.pos.y = player.pos.y + player.speed * dt
    end
    if input.key_down(38)  -- UP
        player.pos.y = player.pos.y - player.speed * dt
    end
end

func draw_game() -> void
    draw.draw_circle(player.pos, 20.0, color.RED)
end

func main()
    init()
    game.run_game("My Game", 800, 600, update, draw_game)
end
```

### 3. Adding Collision

```ori
import ori.game.collision as collision
import ori.game.shape as shape

struct Wall
    rect: shape.Rectangle
end

var walls: list<Wall> = []

func init_walls() -> void
    walls.add(Wall(rect: shape.Rectangle(x: 0.0, y: 550.0, width: 800.0, height: 50.0)))
    walls.add(Wall(rect: shape.Rectangle(x: 0.0, y: 0.0, width: 50.0, height: 600.0)))
end

func check_collisions() -> void
    var player_rect = shape.Rectangle(
        x: player.pos.x - 20.0,
        y: player.pos.y - 20.0,
        width: 40.0,
        height: 40.0
    )

    for wall in walls
        if collision.rects_collide(player_rect, wall.rect)
            -- Handle collision
            io.print("Collision detected!")
        end
    end
end
```

## Key Concepts

### Entity System

Entities are the basic building blocks of your game. Each entity has:
- Position (`pos: Vec2`)
- Velocity (`vel: Vec2`)
- Update function (`update_fn`)
- Draw function (`draw_fn`)

### Systems

Systems process entities in batches:
- `movement_system` — Applies velocity to position
- `gravity_system` — Applies gravity to entities
- `cleanup_system` — Removes dead entities

### Timers

Timers are useful for cooldowns, delays, and animations:

```ori
var cooldown = timer.create_timer(1.0, false, do() =>
    io.print("Ready!")
end)

-- In update:
timer.tick_timer(cooldown, dt)
```

## Keyboard Constants

Common key codes (ASCII):
- `37` — LEFT
- `38` — UP
- `39` — RIGHT
- `40` — DOWN
- `32` — SPACE
- `25` — UP (alternative)
- `65` — A
- `68` — D
- `83` — S
- `87` — W

## Next Steps

- Read the [API Documentation](api.md) for detailed function references
- Check out the [Examples](../examples/) for more complex usage
- Join the Ori community for help and discussions
