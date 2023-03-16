class_name AttackableCharacter2D;
extends Character2D;

@export var _damage: float;
var _is_attacking: bool;

func _attack():
	print(name + " attacked");

