# ori-game

Game engine and raylib bindings for the Ori programming language.

## Features

- 2D game engine with Entity-Component-System architecture
- Raylib bindings for window management, input, rendering, and audio
- Collision detection (primitives + SAT for polygons)
- Tilemap support with chunks for large worlds
- Configurable gameplay mechanics (jumps, dashes, AI, physics)
- Timer system for cooldowns and delays
- Camera system with follow, shake, and limits
- Dialogue system with choices
- Inventory system
- Particle system
- Save/Load system
- Audio manager
- State machine for entity states

## Installation

```toml
# ori.pkg.toml
[dependencies]
ori-game = "0.1.0"
```

## Quick Start

```ori
import ori.game as game
import ori.game.engine as engine
import ori.game.input as input
import ori.game.draw as draw
import ori.game.color as color
import ori.math.vec2 as vec2

struct Player
    pos: vec2.Vec2
    speed: float
end

func main()
    var eng = engine.create_engine()
    engine.enable_system(eng, "gravity")
    engine.enable_system(eng, "movement")

    var player = engine.spawn_entity(eng, vec2.Vec2(x: 400.0, y: 300.0),
        update_fn = do(e: Entity, dt: float) =>
            if input.key_down(39)
                e.vel.x = 200.0
            else
                e.vel.x = 0.0
            end
        end,
        draw_fn = do(e: Entity) =>
            draw.draw_circle(e.pos, 16.0, color.RED)
        end
    )

    game.run_game("My Game", 800, 600, eng)
end
```

## Documentation

### Core

- [shape.oridoc](shape.oridoc) — Formas geométricas
- [collision.oridoc](collision.oridoc) — Detecção de colisão
- [game/engine.oridoc](game/engine.oridoc) — Motor do jogo

### Mechanics

- [game/mechanics/jumps.oridoc](game/mechanics/jumps.oridoc) — Sistema de pulos
- [game/mechanics/dash.oridoc](game/mechanics/dash.oridoc) — Sistema de dash
- [game/mechanics/combat.oridoc](game/mechanics/combat.oridoc) — Sistema de combate
- [game/mechanics/movement.oridoc](game/mechanics/movement.oridoc) — Movimentação
- [game/mechanics/ai.oridoc](game/mechanics/ai.oridoc) — Comportamentos de IA
- [game/mechanics/grab.oridoc](game/mechanics/grab.oridoc) — Agarrar e arrastar
- [game/mechanics/ropes.oridoc](game/mechanics/ropes.oridoc) — Cordas
- [game/mechanics/vehicles.oridoc](game/mechanics/vehicles.oridoc) — Veículos
- [game/mechanics/platforms.oridoc](game/mechanics/platforms.oridoc) — Plataformas móveis

### Game Systems

- [game/dialogue.oridoc](game/dialogue.oridoc) — Sistema de diálogos
- [game/inventory.oridoc](game/inventory.oridoc) — Sistema de inventário
- [game/particles.oridoc](game/particles.oridoc) — Sistema de partículas
- [game/save.oridoc](game/save.oridoc) — Sistema de save/load
- [game/audio.oridoc](game/audio.oridoc) — Gerenciador de áudio
- [game/state_machine.oridoc](game/state_machine.oridoc) — Máquina de estados

### Guides

- [docs/getting-started.md](docs/getting-started.md) — Guia de início rápido
- [docs/api.md](docs/api.md) — Referência completa da API

## Examples

- [hello_game.orl](examples/hello_game.orl) — Jogo simples com movimentação
- [platformer.orl](examples/platformer.orl) — Plataforma com pulo e gravidade
- [space_shooter.orl](examples/space_shooter.orl) — Tiro espacial com tiros e inimigos
- [ai_demo.orl](examples/ai_demo.orl) — Demo de IA com patrulha e perseguição
- [tilemap_demo.orl](examples/tilemap_demo.orl) — Demo de tilemap com colisão
- [dialogue_demo.orl](examples/dialogue_demo.orl) — Demo de diálogo com NPC e escolhas
- [inventory_demo.orl](examples/inventory_demo.orl) — Demo de inventário com coleta
- [physics_demo.orl](examples/physics_demo.orl) — Demo de física com bolas
- [particles_demo.orl](examples/particles_demo.orl) — Demo de partículas
- [state_demo.orl](examples/state_demo.orl) — Demo de máquina de estados
- [audio_demo.orl](examples/audio_demo.orl) — Demo de controle de áudio

## Module Structure

```
ori-game/
├── raylib.orl           # Extern declarations para raylib
├── shape.orl            # Rectangle, Circle, Triangle, Line, Polygon
├── color.orl            # Color + cores predefinidas
├── collision.orl        # Funções de colisão
├── game/
│   ├── engine.orl       # Entity, Timer, Systems, GameLoop
│   ├── input.orl        # Input helpers
│   ├── draw.orl         # Drawing helpers
│   ├── camera.orl       # Camera system
│   ├── timer.orl        # Timer system
│   ├── physics.orl      # Physics 2D
│   ├── tilemap.orl      # TileMap + chunks
│   ├── dialogue.orl     # Dialogue system
│   ├── inventory.orl    # Inventory system
│   ├── particles.orl    # Particle system
│   ├── save.orl         # Save/Load system
│   ├── audio.orl        # Audio manager
│   ├── state_machine.orl # State machine
│   └── mechanics/
│       ├── movement.orl  # 4axis, 8axis, grid
│       ├── jumps.orl     # Coyote time, double jump
│       ├── dash.orl      # Dash, teleport
│       ├── combat.orl    # Health, knockback, cooldowns
│       ├── ai.orl        # Patrol, chase, flee
│       ├── behavior_tree.orl # Behavior trees
│       ├── grab.orl      # Grab and drag
│       ├── ropes.orl     # Ropes
│       ├── vehicles.orl  # Vehicles
│       └── platforms.orl # Moving platforms
├── docs/
│   ├── getting-started.md
│   └── api.md
└── examples/ (11 exemplos)
```

## License

MIT
