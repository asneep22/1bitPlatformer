class_name ExtendedCharacterBody2D;
extends CharacterBody2D;

@export var __speed: float = 5;
@export var __jump_strength: float = 200;
@export var __jumps_count: int = 2;
var __current_jumps_count: int = 2;
var _is_jump_lock: bool;

func _physics_process(_delta):
	if is_on_floor():
		reset_jumps();

func _move(direction: float):
	velocity.x = direction * __speed;

func _jump():
	velocity.y = -__jump_strength;
	__current_jumps_count -= 1;

func is_has_jumps() -> bool:
	return __current_jumps_count > 0;
	
func is_jump_lock() -> bool:
	return _is_jump_lock;

func reset_jumps():
		__current_jumps_count = __jumps_count;
