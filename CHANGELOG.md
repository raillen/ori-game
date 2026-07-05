# Changelog

All notable changes to ori-game will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-07-05

### Added

- Initial release of ori-game engine
- Raylib bindings for window, shapes, textures, text, input, and audio
- Core engine with Entity, Timer, Systems, and Game Loop
- Shape structs (Rectangle, Circle, Triangle, Line, Polygon)
- Color system with predefined colors
- Collision detection (primitives + SAT for polygons)
- Camera system with follow, shake, and limits
- Input helpers for keyboard and mouse
- Drawing helpers for common shapes
- Timer system with repeat and callbacks
- Physics 2D with gravity and collision resolution
- Tilemap support with chunks for large worlds
- Movement mechanics (4axis, 8axis, grid)
- Jump mechanics (coyote time, double jump, variable height)
- Dash mechanics with cooldown
- Combat system (health, knockback, knockdown, cooldowns)
- AI behaviors (patrol, chase, flee, wander)
- Behavior tree system
- Grab and drag mechanics
- Rope physics
- Vehicle mechanics
- Moving platforms
- Dialogue system
- Inventory system
- Particle system
- Save/Load system
- Audio manager with volume control and fading
- State machine for entity states
- Documentation (.oridoc files)
- Examples (hello_game, platformer)
