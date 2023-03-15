extends Character;

@onready var feet_point = $Feet;

@export var _respawn_point: Node2D;
@export var _camera: ShakableCamera2D;

func _ready():
	onDeath.connect(__respawn);

func _physics_process(delta):
	var move_direction: float = Input.get_axis("move_left", "move_right");
	
	move(move_direction);
	rotate_to_movement_direction(move_direction)
	play_default_animations();
	
	super._physics_process(delta);
	
func _input(event):
	if event.is_action_pressed("jump") and is_can_jump():
		ParticleCreator.CreateOneShot(self, load("res://Scenes/Subscenes/Particles/JumpParticles.tscn"), feet_point.global_position)
		jump();

func __respawn():
	ParticleCreator.CreateOneShot(get_parent(), load("res://Scenes/Subscenes/Particles/DeathParticles.tscn"), feet_point.global_position);
	set_physics_process(false);
	set_visible(false);
	_camera.shake(.3, 20, 40);
	#global_position = _respawn_point.global_position;
