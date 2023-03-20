class_name BaseState;
extends Node2D;

enum state {
	IDLE = 1,
	RUN,
	JUMP,
	FALL,
	WALL_SLIDE,
	WALL_JUMP,
	ATTACK,
	DASH,
	DEATH,
	RESPAWN,
}

var character_2d: Character2D;

func _enter():
	print(character_2d.name + " entered to " + name);
	
func _exit():
	pass;
	
func _input_key(_event: InputEvent):
	pass;
	
func _update(_delta):
	pass;
	
func _physics_update(_delta):
	pass;
