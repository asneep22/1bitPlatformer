extends AttackableCharacter2D;

enum State {
	NULL = -1,
	IDLE,
	RUN,
	JUMP,
	FALL,
	ATTACK
}

var __currentState = State.IDLE;

@onready var __feet_point = $Feet;
@export var __camera: ExtandableCamera;

@export_group("Death")
@export var __shake_duration: float = .35;
@export var __shake_frequency: float = 20;
@export var __shake_amplitude: float = 30;

@export_group("Attack")
@export var __check_floor_tick: float = .05;
@export var __shake_amplitude_per_tick: float = 5;
@export var __shake_frequency_per_tick: float = 5;

func _ready():
	onDeath.connect(__apply_death_effects);

func _physics_process(delta):
	var move_direction: float = Input.get_axis("move_left", "move_right");
	velocity.y += __gravity_scale;
	move_and_slide();
	
	if(move_direction != 0):
		_animated_sprite.play("run");
	else:
		_animated_sprite.play("idle");
	
	if(is_on_floor()):
		reset_jumps();
	
	match __currentState:
		State.IDLE:
			if(move_direction != 0):
				__currentState = State.RUN;
				
			if Input.is_action_just_pressed("jump"):
				__currentState = State.JUMP;
				
			if !is_on_floor():
				__currentState = State.FALL;
		State.RUN:
			_move(move_direction);
			rotate_to_movement_direction(move_direction);
			
			if(move_direction == 0):
				__currentState = State.IDLE;
				
			if Input.is_action_just_pressed("jump"):
				__currentState = State.JUMP;
				
			if !is_on_floor():
				__currentState = State.FALL;
		State.JUMP:
			_jump();
			__currentState = State.FALL;
		State.FALL:
			_move(move_direction);
			rotate_to_movement_direction(move_direction);
			
			if Input.is_action_just_pressed("jump"):
				__currentState = State.JUMP;
				
			if (Input.is_action_just_pressed("attack")):
				_attack();
				__currentState = State.ATTACK;
			
			if is_on_floor():
				__currentState = State.IDLE;
		State.ATTACK:
			velocity.y = 1500;
			velocity.x = 0;
			
			if is_on_floor():
				__camera.shake(__shake_duration, __gravity_scale, __shake_amplitude);
				ParticleCreator.CreateOneShot(self, load("res://Scenes/Subscenes/Particles/JumpParticles.tscn"), __feet_point.global_position);
				
			if is_on_floor():
				__currentState = State.IDLE;

func _jump():
	if is_has_jumps() && !is_jump_lock():
		super._jump();
		ParticleCreator.CreateOneShot(self, load("res://Scenes/Subscenes/Particles/JumpParticles.tscn"), __feet_point.global_position)

func __apply_death_effects():
	ParticleCreator.CreateOneShot(get_parent(), load("res://Scenes/Subscenes/Particles/DeathParticles.tscn"), __feet_point.global_position);
	lock();
	set_visible(false);
	__camera.shake(__shake_duration, __shake_frequency, __shake_amplitude);
	#global_position = _respawn_point.global_position;
	
func lock():
	set_physics_process(false);
	_is_attacking = false;
	
func unlock():
	set_physics_process(true);
