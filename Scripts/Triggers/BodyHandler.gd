class_name BodyHandler;
extends Area2D

signal __on_entered;
signal __on_exit;

@export_placeholder("Name") var __collision_group_name: String

func _ready():
	connect("body_entered", _on_body_entered);
	connect("body_exited", _on_body_exited);

func _on_body_entered(other):
	if other.is_in_group(__collision_group_name):
		__on_entered.emit();
		print(other.name + " entered " + name);
		
func _on_body_exited(other):
	if other.is_in_group(__collision_group_name):
		__on_exit.emit();
		print(other.name + " exited from " + name)
