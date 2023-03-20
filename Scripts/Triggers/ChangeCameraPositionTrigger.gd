extends Character2DHandler;

@onready var camera: ExtandableCamera =  get_tree().get_root().get_camera_2d();

@export var target: Node2D;

func _ready():
	super._ready();
	on_entered.connect(__start_move);

func __start_move():
	camera.move_to(target);
