# ori-game API Reference

Complete API reference for the ori-game engine.

## Core Modules

### engine

The main game engine module.

#### Functions

| Function | Description |
|----------|-------------|
| `create_engine()` | Creates a new engine instance |
| `register_system(eng, name, func)` | Registers a system |
| `enable_system(eng, name)` | Enables a system |
| `disable_system(eng, name)` | Disables a system |
| `spawn_entity(eng, pos, update_fn, draw_fn)` | Spawns a new entity |
| `tick(eng, dt)` | Runs all active systems |
| `draw_all(eng)` | Draws all alive entities |
| `cleanup_dead(eng)` | Removes dead entities |

#### Types

- `Engine` — Main engine struct
- `Entity` — Game entity
- `System` — Processing system
- `Timer` — Timing utility

### input

Input handling module.

#### Functions

| Function | Description |
|----------|-------------|
| `key_pressed(key)` | Returns true if key was just pressed |
| `key_down(key)` | Returns true if key is held down |
| `key_released(key)` | Returns true if key was just released |
| `mouse_pos()` | Returns current mouse position |
| `mouse_delta()` | Returns mouse movement since last frame |
| `mouse_pressed(button)` | Returns true if mouse button was just pressed |
| `mouse_down(button)` | Returns true if mouse button is held down |

### draw

Drawing helpers module.

#### Functions

| Function | Description |
|----------|-------------|
| `draw_rect(rect, color)` | Draws a filled rectangle |
| `draw_rect_outline(rect, color, thickness)` | Draws a rectangle outline |
| `draw_circle(center, radius, color)` | Draws a filled circle |
| `draw_circle_outline(center, radius, color)` | Draws a circle outline |
| `draw_line(a, b, color, thickness)` | Draws a line |
| `draw_triangle(v1, v2, v3, color)` | Draws a triangle |
| `draw_text(text, pos, size, color)` | Draws text |
| `draw_text_centered(text, pos, size, color)` | Draws centered text |

### camera

Camera system module.

#### Functions

| Function | Description |
|----------|-------------|
| `create_camera(pos)` | Creates a new camera |
| `update_camera(cam, dt)` | Updates camera (follow, shake, limits) |
| `camera_shake(cam, intensity, duration)` | Triggers screen shake |
| `set_limits(cam, min, max)` | Sets camera movement limits |
| `follow(cam, target)` | Sets camera to follow an entity |

### color

Color system module.

#### Constants

`RAYWHITE`, `BLACK`, `WHITE`, `RED`, `GREEN`, `BLUE`, `YELLOW`, `ORANGE`, `PURPLE`, `PINK`, `DARKGRAY`, `LIGHTGRAY`, `GRAY`, `MAROON`, `DARKGREEN`, `DARKBLUE`, `DARKPURPLE`, `DARKBROWN`

#### Functions

| Function | Description |
|----------|-------------|
| `from_rgb(r, g, b)` | Creates color from RGB values |
| `from_rgba(r, g, b, a)` | Creates color from RGBA values |
| `from_hex(hex)` | Creates color from hex value |
| `to_hex(c)` | Converts color to hex value |
| `fade(c, alpha)` | Returns color with adjusted alpha |

### shape

Shape structs module.

#### Types

- `Rectangle` — Rectangle with x, y, width, height
- `Circle` — Circle with x, y, radius
- `Triangle` — Triangle with three points
- `Line` — Line with two points
- `Polygon` — Polygon with list of points

### collision

Collision detection module.

#### Functions

| Function | Description |
|----------|-------------|
| `point_in_rect(point, rect)` | Point inside rectangle check |
| `point_in_circle(point, circle)` | Point inside circle check |
| `point_in_triangle(point, tri)` | Point inside triangle check |
| `rects_collide(a, b)` | AABB collision check |
| `rect_in_rect(a, b)` | Rectangle containment check |
| `circles_collide(a, b)` | Circle collision check |
| `rect_circle_collide(rect, circle)` | Rectangle-circle collision |
| `lines_intersect(a, b)` | Line intersection check |
| `line_rect_intersect(line, rect)` | Line-rectangle intersection |
| `polygons_collide(a, b)` | SAT polygon collision |
| `point_in_polygon(point, poly)` | Point inside polygon check |

## Mechanics Modules

### jumps

Jump mechanics module.

#### Types

- `JumpConfig` — Jump configuration
- `JumpState` — Jump state tracking

#### Functions

| Function | Description |
|----------|-------------|
| `can_jump(state, config)` | Checks if entity can jump |
| `apply_jump(e, state, config)` | Applies jump to entity |
| `update_jump_state(state, config, dt)` | Updates jump state |

### dash

Dash mechanics module.

#### Types

- `DashConfig` — Dash configuration
- `DashState` — Dash state tracking

#### Functions

| Function | Description |
|----------|-------------|
| `can_dash(state, config, on_ground)` | Checks if entity can dash |
| `start_dash(e, state, config, dir)` | Starts dash |
| `update_dash(e, state, dt)` | Updates dash |

### combat

Combat system module.

#### Types

- `Health` — Health system
- `KnockbackConfig` — Knockback configuration
- `KnockdownState` — Knockdown state
- `Cooldown` — Cooldown timer

#### Functions

| Function | Description |
|----------|-------------|
| `take_damage(h, amount)` | Applies damage |
| `heal(h, amount)` | Heals entity |
| `is_alive(h)` | Checks if alive |
| `set_invincible(h, duration)` | Sets invincibility |
| `apply_knockback(e, dir, config)` | Applies knockback |
| `apply_knockdown(state, duration)` | Applies knockdown |
| `use_cooldown(c)` | Uses cooldown |
| `tick_cooldown(c, dt)` | Updates cooldown |

### movement

Movement mechanics module.

#### Functions

| Function | Description |
|----------|-------------|
| `move_4axis(e, speed, dt, up, down, left, right)` | 4-directional movement |
| `move_8axis(e, speed, dt, up, down, left, right)` | 8-directional movement |
| `move_grid(e, grid_size, dir)` | Grid-based movement |
| `snap_to_grid(pos, grid_size)` | Snaps position to grid |

### ai

AI behaviors module.

#### Types

- `PatrolState` — Patrol behavior state
- `WanderState` — Wander behavior state

#### Functions

| Function | Description |
|----------|-------------|
| `update_patrol(e, state, dt)` | Updates patrol behavior |
| `update_chase(e, target, speed, dt)` | Updates chase behavior |
| `update_flee(e, threat, speed, dt)` | Updates flee behavior |
| `update_wander(e, state, dt)` | Updates wander behavior |
| `can_see(e, target, max_dist)` | Line of sight check |
| `distance_to(e, target)` | Distance to target |

### behavior_tree

Behavior tree module.

#### Types

- `BTStatus` — Behavior tree status (Success, Failure, Running)
- `BTNode` — Behavior tree node
- `BTSequence` — Sequence composite
- `BTSelector` — Selector composite
- `BTDecorator` — Decorator node
- `BehaviorTree` — Complete behavior tree

#### Functions

| Function | Description |
|----------|-------------|
| `run_sequence(seq)` | Runs sequence node |
| `run_selector(sel)` | Runs selector node |
| `run_decorator(dec)` | Runs decorator node |
| `run_tree(tree)` | Runs complete tree |

## Game Modules

### dialogue

Dialogue system module.

#### Types

- `DialogueLine` — Dialogue line
- `DialogueChoice` — Dialogue choice
- `DialogueState` — Dialogue state

#### Functions

| Function | Description |
|----------|-------------|
| `start_dialogue(state, lines)` | Starts dialogue |
| `advance_dialogue(state)` | Advances to next line |
| `select_choice(state, index)` | Selects a choice |
| `update_dialogue(state, dt)` | Updates dialogue (typewriter) |
| `get_display_text(state)` | Gets current displayed text |
| `get_current_speaker(state)` | Gets current speaker |
| `has_choices(state)` | Checks if line has choices |
| `get_choices(state)` | Gets available choices |
| `end_dialogue(state)` | Ends dialogue |

### inventory

Inventory system module.

#### Types

- `Item` — Item definition
- `InventorySlot` — Inventory slot
- `Inventory` — Inventory container

#### Functions

| Function | Description |
|----------|-------------|
| `create_inventory(max_slots)` | Creates inventory |
| `add_item(inv, item, count)` | Adds item to inventory |
| `remove_item(inv, item_id, count)` | Removes item from inventory |
| `has_item(inv, item_id)` | Checks if inventory has item |
| `get_item_count(inv, item_id)` | Gets item count |
| `use_item(inv, slot)` | Uses item in slot |
| `clear_inventory(inv)` | Clears inventory |
| `get_slot(inv, index)` | Gets slot at index |

### particles

Particle system module.

#### Types

- `Particle` — Single particle
- `ParticleEmitter` — Particle emitter
- `ParticleSystem` — Particle system

#### Functions

| Function | Description |
|----------|-------------|
| `create_particle_system(max_particles)` | Creates particle system |
| `add_emitter(system, emitter)` | Adds emitter to system |
| `emit(system, emitter, count)` | Emits particles |
| `emit_at(system, pos, count, config)` | Emits at position |
| `update_particles(system, dt)` | Updates particles |
| `draw_particles(system)` | Draws particles |
| `clear_particles(system)` | Clears all particles |
| `particle_count(system)` | Gets particle count |

### save

Save/Load system module.

#### Types

- `Checkpoint` — Save checkpoint
- `SaveData` — Save data structure
- `SaveSystem` — Save system manager

#### Functions

| Function | Description |
|----------|-------------|
| `create_save_system()` | Creates save system |
| `add_checkpoint(system, cp)` | Adds checkpoint |
| `activate_checkpoint(system, cp_id)` | Activates checkpoint |
| `get_last_checkpoint(system)` | Gets last checkpoint |
| `respawn_position(system)` | Gets respawn position |
| `save_game(data, slot)` | Saves game |
| `load_game(slot)` | Loads game |
| `delete_save(slot)` | Deletes save |
| `has_save(slot)` | Checks if save exists |

### audio

Audio manager module.

#### Types

- `AudioManager` — Audio manager

#### Functions

| Function | Description |
|----------|-------------|
| `create_audio_manager()` | Creates audio manager |
| `init_audio()` | Initializes audio device |
| `close_audio()` | Closes audio device |
| `play_sfx(mgr, sound)` | Plays sound effect |
| `play_music(mgr, music)` | Plays music |
| `stop_music(mgr)` | Stops music |
| `pause_music(mgr)` | Pauses music |
| `resume_music(mgr)` | Resumes music |
| `set_master_volume(mgr, volume)` | Sets master volume |
| `set_music_volume(mgr, volume)` | Sets music volume |
| `set_sfx_volume(mgr, volume)` | Sets SFX volume |
| `fade_music(mgr, target, duration)` | Fades music |
| `update_audio(mgr, dt)` | Updates audio |
| `is_music_playing(mgr)` | Checks if music is playing |

### state_machine

State machine module.

#### Types

- `State` — State definition
- `StateMachine` — State machine

#### Functions

| Function | Description |
|----------|-------------|
| `create_state_machine()` | Creates state machine |
| `add_state(sm, state)` | Adds state |
| `change_state(sm, name)` | Changes to new state |
| `update_state(sm, dt)` | Updates current state |
| `get_current_state_name(sm)` | Gets current state name |
| `get_previous_state_name(sm)` | Gets previous state name |
| `is_in_state(sm, name)` | Checks if in specific state |
