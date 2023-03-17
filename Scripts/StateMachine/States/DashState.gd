class_name DashState;
extends BaseState;

@export_group("Dash")
@export var __dash_speed: float = 1450;
@export var __dash_time: float = .15;
@onready var __ghost_trail: GhostTrail = $"../../GhostTrail";
@onready var __current_dash_time: float = __dash_time;

func _enter():
	super._enter();

func _physics_update(delta):
	__ghost_trail.update(delta);

	__current_dash_time -= delta;
	character_2d.velocity.x = __dash_speed * (-1 if character_2d._animated_sprite.flip_h else 1);

	if (Input.is_action_just_pressed("attack")):
		(character_2d as AttackableCharacter2D)._attack();
		return state.ATTACK;

	if __current_dash_time <= 0:
		__current_dash_time = __dash_time;
		return state.IDLE;	
		
func _input_key(event):
	if event.is_action_pressed("attack"):
		return
