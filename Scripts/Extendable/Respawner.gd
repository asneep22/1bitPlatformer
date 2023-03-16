class_name Respawner;
extends CanvasLayer

@export var __seconds_to_respawn: int = 3;
@export var __respawn_point: Node2D;
@export var __respawnable_object: Node2D;

var __current_seconds_to_respawn: int = __seconds_to_respawn;

func _respawn():
	while __current_seconds_to_respawn > 1:
		await  get_tree().create_timer(1).timeout;
		__current_seconds_to_respawn -= 1;
	

	__respawnable_object.set_physics_process(true);
	__respawnable_object.set_visible(true);
	__current_seconds_to_respawn = __seconds_to_respawn;
	__respawnable_object.global_position = __respawn_point.global_position;
