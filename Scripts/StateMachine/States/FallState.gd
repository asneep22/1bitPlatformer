class_name FallState;
extends BaseState;

@export_placeholder("animation_name") var __animation_name: String = "Fall"

func _enter():
	super._enter();
	character_2d.animation_player.play(__animation_name);
	
func _physics_update(delta):
	var move_direction: float = Input.get_axis("move_left", "move_right");
	
	character_2d._move(move_direction);
	character_2d.rotate_to_movement_direction(move_direction);

	if character_2d.is_on_floor():
		return state.IDLE;
		
	if character_2d.is_on_wall():
		return state.WALL_SLIDE;

func _input_key(event):
	if event.is_action_pressed("jump"):
		return state.JUMP;
		
	if Input.is_action_just_pressed("dash"):
		return state.DASH;
		
	if (Input.is_action_just_pressed("attack")):
		return state.ATTACK;
