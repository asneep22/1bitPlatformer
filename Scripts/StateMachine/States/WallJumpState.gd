class_name WallJumpState;
extends BaseState;

@export_group("Wall slide")
@export var __wall_jump_horizontal_strength: float = 150;
@export var __wall_jump_vertical_strength: float = 1200;
@export var __check_floor_time:float = .15;
@onready var __wall_slide_state: WallSlideState = $"../WallSlideState";
var _previous_jump_position: Vector2;

func _enter():
	super._enter();
	
	character_2d.velocity.y = -__wall_jump_vertical_strength;
	character_2d.velocity.x = __wall_jump_horizontal_strength * 1 if character_2d._sprite_2d.flip_h else -1;
	character_2d._play_random_jump_sound();
	ParticleCreator.CreateOneShot(self, load("res://Scenes/Subscenes/Particles/JumpParticles.tscn"), character_2d._feet_point.global_position);
	
func _physics_update(delta):
	var move_direction: float = Input.get_axis("move_left", "move_right");
	character_2d._move(move_direction);
	character_2d.rotate_to_movement_direction(move_direction);
	
	if !character_2d.velocity.y < 0:
		return state.FALL;
	
	if character_2d.is_on_floor():
		return state.IDLE;
		
func _input_key(event):
	if event.is_action_pressed("jump") && __wall_slide_state.__is_can_slide:
		return state.WALL_JUMP;
	else:
		return state.FALL;

