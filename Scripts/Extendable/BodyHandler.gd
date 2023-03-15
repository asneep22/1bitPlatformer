class_name BodyHandler;
extends Area2D

func _ready():
	connect("body_entered", _on_body_entered);
	
func _on_body_entered(other):
	print(other.name + " entered " + name);

func _on_body_exit(other):
	print(other.name + " exited from " + name)
