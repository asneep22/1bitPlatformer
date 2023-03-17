class_name RunState;
extends BaseState;

func _enter():
	super._enter();

func _physics_update(delta):
	var move_direction: float = Input.get_axis("move_left", "move_right");
	
	character_2d._move(move_direction);
	character_2d.rotate_to_movement_direction(move_direction);
	character_2d._animated_sprite.play("run");

	if(move_direction == 0):
		return state.IDLE;
		
	if !character_2d.is_on_floor():
		return state.FALL;
		
func _input_key(event):
	if event.is_action_pressed("jump"):
		return state.JUMP;
		
	if event.is_action_pressed("dash"):
		return state.DASH;
	
