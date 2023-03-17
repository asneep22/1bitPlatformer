extends AttackableCharacter2D;

@export var __state_manager: StateManager;

enum State {
	IDLE,
	RUN,
	JUMP,
	WALL_SLIDE,
	WALL_JUMP,
	DASH,
	FALL,
	ATTACK,
	DEATH
}

@onready var __feet_point = $Feet;
@export var __camera: ExtandableCamera;

@export_group("Death")
@export var __shake_duration: float = .35;
@export var __shake_frequency: float = 20;
@export var __shake_amplitude: float = 30;

func _ready():
	__state_manager.init(self);
	onDeath.connect(__apply_death_effects);
	
func _physics_process(delta):
	velocity.y += ProjectSettings.get_setting("physics/2d/default_gravity");
	move_and_slide();
	__state_manager._physics_process(delta);

func __apply_death_effects():
	ParticleCreator.CreateOneShot(get_parent(), load("res://Scenes/Subscenes/Particles/DeathParticles.tscn"), __feet_point.global_position);
	lock();
	set_visible(false);
	__camera.shake(__shake_duration, __shake_frequency, __shake_amplitude);
	
func lock():
	set_physics_process(false);
	
func unlock():
	set_physics_process(true);
