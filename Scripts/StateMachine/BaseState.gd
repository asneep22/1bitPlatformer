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
}

var character_2d: Character2D;

func _enter():
	print(character_2d.name + " entered to " + name);
	return state.IDLE;
	
func _exit():
	return state.IDLE;
	
func _input_key(_event):
	return state.IDLE;
	
func _process(_delta):
	return state.IDLE;
	
func _physics_update(_delta):
	return state.IDLE;
