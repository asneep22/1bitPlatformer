class_name AttackState;
extends BaseState;

@onready var __extandable_camera: ExtandableCamera = get_viewport().get_camera_2d();
@export_placeholder("animation_name") var _fall_animation_name: String = "Fall";
@export var __attack_velocity: float = 1300;
@export var __repusle_strength: float = 1200;
@export var __shake_duration: float = .25;
@export var __shake_frequancy: float = 45;
@export var __shake_amplitude_per_tick: float = 2;
var __shake_amplitude: float;
var __is_repulse: bool = false;

func _enter():
	super._enter();
	character_2d.velocity.y = __attack_velocity;
	character_2d.velocity.x = 0;
	character_2d.animation_player.play(_fall_animation_name);

func _physics_update(delta):
	__shake_amplitude += __shake_amplitude_per_tick;
	
	if (character_2d as Player).attackRay.get_collider() is Character2D:
		((character_2d as Player).attackRay.get_collider() as Node2D).queue_free();
	
	if character_2d.is_on_floor():
		character_2d.velocity.y = -__repusle_strength;
		character_2d._play_random_attack_sound();
		character_2d.reset_jumps();
		return state.FALL;

func _exit():
	ParticleCreator.CreateOneShot(self, load("res://Scenes/Subscenes/Particles/JumpParticles.tscn"), character_2d._feet_point.global_position)
	__extandable_camera.shake(__shake_duration, __shake_frequancy, __shake_amplitude);
	__shake_amplitude = 0;
		
func _input_key(event):
	if event.is_action_pressed("jump"):
		return state.JUMP;
