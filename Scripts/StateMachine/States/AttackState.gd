class_name AttackState;
extends BaseState;

@onready var __extandable_camera: ExtandableCamera = get_viewport().get_camera_2d();
@export var __attack_velocity: float = 1300;
@export var __shake_duration: float = .25;
@export var __shake_frequancy: float = 45;
@export var __shake_amplitude_per_tick: float = 2;
var __shake_amplitude: float;

func _enter():
	super._enter();

func _physics_update(delta):
	character_2d.velocity.y = __attack_velocity;
	character_2d.velocity.x = 0;
	__shake_amplitude += __shake_amplitude_per_tick;

	if character_2d.is_on_floor():
		__extandable_camera.shake(__shake_duration, __shake_frequancy, __shake_amplitude);
		ParticleCreator.CreateOneShot(self, load("res://Scenes/Subscenes/Particles/JumpParticles.tscn"), character_2d.__feet_point.global_position)
		__shake_amplitude = 0;

	if character_2d.is_on_floor():
		return state.IDLE;
		
func _input_key(event):
	if event.is_action_pressed("jump"):
		return state.JUMP;
