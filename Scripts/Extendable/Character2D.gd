class_name Character2D;
extends ExtendedCharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D;

signal onDeath;

func play_default_animations():
	
	if (!is_on_floor()):
		pass #Анимация прыжка;
	
	if velocity.x == 0:
		_animated_sprite.play("idle");
	else:
		_animated_sprite.play("run");
	
func __play_jump_animation():
	_animated_sprite.play("idle");

func rotate_to_movement_direction(move_direction):
	if move_direction != 0:
		_animated_sprite.set_flip_h(move_direction < 0);

func _death():
	onDeath.emit();
