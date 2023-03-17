class_name IdleState;
extends BaseState;

@export_placeholder("animation name") var __animation_name: String = "idle"

func _enter():
	super._enter();
	character_2d.velocity.x = 0;
	character_2d._animated_sprite.play(__animation_name);
	character_2d.reset_jumps();

func _physics_update(delta):
	var move_direction: float = Input.get_axis("move_left", "move_right");

	if(move_direction != 0):
		return state.RUN;

	if !character_2d.is_on_floor():
		return state.FALL;
		
func _input_key(event):
	if event.is_action_pressed("jump"):
		return state.JUMP;
