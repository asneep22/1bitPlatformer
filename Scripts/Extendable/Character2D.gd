class_name Character2D;
extends ExtendedCharacterBody2D

@onready var _animated_sprite: AnimatedSprite2D = $AnimatedSprite2D;
@onready var _feet_point: Node2D = $Feet;

signal onDeath;

func rotate_to_movement_direction(move_direction):
	if move_direction != 0:
		_animated_sprite.set_flip_h(move_direction < 0);

func _death():
	onDeath.emit();
