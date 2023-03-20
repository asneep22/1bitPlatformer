class_name RespawnState;
extends BaseState;

@export_group("Respawn state")
@onready var __extandable_camera: ExtandableCamera = get_tree().get_root().get_camera_2d();
@onready var __current_respawn_time = __respawn_time;
@export var __respawn_time: float = 3;
@export var __shake_duration: float = .25;
@export var __shake_frequency: float = 40;
@export var __shake_amplitude: float = 10;
var respawn_point: Vector2;

func _physics_update(delta):
	__current_respawn_time -= delta;
	if(__current_respawn_time <= 0):
		return state.IDLE;
		
func _exit():
	character_2d.global_position = respawn_point;
	character_2d.set_visible(true);
	character_2d.set_process(true);
	__current_respawn_time = __respawn_time;
	__extandable_camera.shake(__shake_duration, __shake_frequency, __shake_amplitude);
	ParticleCreator.CreateOneShot(self, load("res://Scenes/Subscenes/Particles/JumpParticles.tscn"), character_2d._feet_point.global_position);

