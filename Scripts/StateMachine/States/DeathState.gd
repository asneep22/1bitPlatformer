class_name DeathState;
extends BaseState;

@export_group("Death_state")
@onready var __extandable_camera: ExtandableCamera = get_tree().get_root().get_camera_2d();
@export var __shake_duration: float = .35;
@export var __shake_frequency: float = 20;
@export var __shake_amplitude: float = 30;

func _enter():
	character_2d.collision_shape.disabled = true;
	character_2d.set_visible(false);
	character_2d.set_process(false);
	character_2d._play_random_death_sound();
	__extandable_camera.shake(__shake_duration, __shake_frequency, __shake_amplitude);
	ParticleCreator.CreateOneShot(get_tree().get_root().get_child(0), load("res://Scenes/Subscenes/Particles/DeathParticles.tscn"), character_2d._feet_point.global_position);

func _physics_update(delta):
	return state.RESPAWN;
	
	

