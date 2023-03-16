extends BodyHandler;

@onready var camera: ExtandableCamera =  get_parent().get_node("Camera2D");

@export var target: Node2D;

func _ready():
	super._ready();
	_on_entered.connect(__start_move);

func __start_move():
	camera.move_to(target);
