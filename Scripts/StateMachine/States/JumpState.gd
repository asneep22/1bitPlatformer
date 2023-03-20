class_name JumpState;
extends BaseState;

@export_placeholder("animation_name") var jump_animation_name: String = "Jump";

func _enter():
	super._enter();
	
	if character_2d.is_has_jumps() && !character_2d.is_jump_lock():
		character_2d._jump();
		character_2d._play_random_jump_sound();
		character_2d.animation_player.stop();
		character_2d.animation_player.play(jump_animation_name);
		ParticleCreator.CreateOneShot(self, load("res://Scenes/Subscenes/Particles/JumpParticles.tscn"), character_2d._feet_point.global_position);
	
func _physics_update(delta):
	var move_direction: float = Input.get_axis("move_left", "move_right");
	character_2d._move(move_direction);
	character_2d.rotate_to_movement_direction(move_direction);
	
	if character_2d.velocity.y >= 0:
		return state.FALL;

func _input_key(event: InputEvent):
	if event.is_action_pressed("attack"):
		return state.ATTACK;
		
	if event.is_action_pressed("jump"):
		return state.JUMP;
	
	if Input.is_action_just_pressed("dash"):
		return state.DASH;
