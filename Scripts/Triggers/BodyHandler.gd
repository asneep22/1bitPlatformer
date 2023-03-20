class_name Character2DHandler;
extends Area2D

signal on_entered;
signal on_exited;
signal on_character_entered(character2D: Character2D);
signal on_character_exited(character2D: Character2D);

func _ready():
	connect("body_entered", _on_body_entered);
	connect("body_exited", _on_body_exited);

func _on_body_entered(body: Node2D):
	on_entered.emit();
	if body is Character2D:
		on_character_entered.emit(body);
	
	print(body.name + "collided with" + name)

func _on_body_exited(body: Node2D):
	on_exited.emit();
	if body is Character2D:
		on_character_exited.emit();
	
	print(body.name + "uncollided with" + name)


