class_name FallState;
extends BaseState;

#@onready var __wall_checker_up: RayCast2D = $"../../WallCheckerUp";
#@onready var __wall_checker_down: RayCast2D = $"../../WallCheckerDown";
#@onready var __ground_cheker: RayCast2D = $"../../DistanceToGroundChecker";

func _enter():
	super._enter();
	
func _physics_update(delta):
	var move_direction: float = Input.get_axis("move_left", "move_right");
#	var up_checker_detect_wall: bool =  __wall_checker_up.get_collider() != null;
#	var down_checker_detect_wall: bool = __wall_checker_down.get_collider() != null;
#	var is_distance_to_ground_bigger: bool = __ground_cheker.get_collider() == null;
	
#	__wall_checker_down.scale *= -move_direction;
#	__wall_checker_up.scale *= -move_direction;
	
	character_2d._move(move_direction);
	character_2d.rotate_to_movement_direction(move_direction);
	character_2d._animated_sprite.play("run");

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
