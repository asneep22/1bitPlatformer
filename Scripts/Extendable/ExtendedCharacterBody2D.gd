class_name ExtendedCharacterBody2D;
extends CharacterBody2D;

@export var __gravity_scale: float = 9.8;
@export var __speed: float = 5;
@export var __jump_strength: float = 200;
@export var __jumps_count: int = 2;
var __current_jumps_count: int = 2;

func _physics_process(delta):
	if is_on_floor():
		reset_jumps();

func move(direction: float):
	velocity.y += __gravity_scale;
	velocity.x = direction * __speed;
	move_and_slide();

func jump():
	if is_can_jump():
		velocity.y = -__jump_strength;
		__current_jumps_count -= 1;

func is_can_jump() -> bool:
	return __current_jumps_count > 0;

func reset_jumps():
		__current_jumps_count = __jumps_count;
