class_name WallSlideState;
extends BaseState;

@export_group("Wall slide")
@export var _max_slide_time: float = 1.5;
@onready var __wall_checker_head: RayCast2D = $"../../WallCheckerUp";
@onready var __wall_checker_feet: RayCast2D = $"../../WallCheckerDown";
@onready var __ground_cheker: RayCast2D = $"../../DistanceToGroundChecker";
@onready var _current_slide_time: float = _max_slide_time;
var __is_wall_on_head_level_detect: bool;
var __is_wall_on_feet_level_detect: bool;
var __is_ground_far: bool;
var __is_can_wall_jump: bool;
var __is_can_slide: bool;

func _enter():
	super._enter();
	_current_slide_time = _max_slide_time;
	__wall_checker_feet.scale *= -1;
	__wall_checker_head.scale *= -1;
	
func _physics_update(delta):
	__is_wall_on_head_level_detect =  __wall_checker_head.get_collider() != null;
	__is_wall_on_feet_level_detect = __wall_checker_feet.get_collider() != null;
	__is_ground_far = __ground_cheker.get_collider() == null;
	
	__is_can_slide = __is_wall_on_head_level_detect && __is_wall_on_feet_level_detect && __is_ground_far && _current_slide_time > 0;
	__is_can_wall_jump = __is_wall_on_head_level_detect && __is_wall_on_feet_level_detect && __is_ground_far;
	
	if !__is_can_wall_jump || !__is_can_slide:
		return state.FALL;
		
	_current_slide_time -= delta;
	super._physics_update(delta);
	_current_slide_time -= delta;
	character_2d.velocity.y = 0;

	if character_2d.is_on_floor():
		return state.IDLE;

func _exit():
	_current_slide_time = _max_slide_time;
	super._exit();

func _input_key(event):
	if (event.is_action_pressed("jump") && __is_can_wall_jump):
		return state.WALL_JUMP;
		
	if (event.is_action_pressed("attack")):
		return state.ATTACK;

