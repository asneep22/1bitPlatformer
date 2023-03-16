class_name BaseState;
extends Node

enum State {
	Null = -1,
	Idle,
	Run,
	Jump,
	Fall,
	Attack
}

func enter() -> void:
	pass;
	
func exit() -> void:
	pass;
	
func _input(event):
	return State.Null;
	
func _process(delta):
	return State.Null;
	
func _physics_process(delta):
	return State.Null;
