class_name GhostTrail;
extends Node2D

@onready var __target_sprite_2d : Sprite2D = $"../Sprite2D";
@export var __sprites_per_second: int = 100;
@export var __start_modulate: Color = Color(1,1,1,.5);
@export var __fade_off_time = .3;

var __time: int = 1 / __sprites_per_second;

func update(delta):
	
	__time -= delta;
	
	if(__time <= 0):
	#	__create_sprite();
		__time = 1 / __sprites_per_second;

func create_sprite(sprite_2d: Sprite2D):
	var sprite2D = Sprite2D.new();
	var tween = get_tree().create_tween();
	
	get_tree().get_root().get_child(0).add_child(sprite2D);
	
	sprite2D.global_position = global_position;
	sprite2D.scale.x = -1 if __target_sprite_2d.flip_h else 1;
	sprite2D.modulate = __start_modulate;
	sprite2D.texture = sprite_2d.texture;
	sprite2D.vframes = sprite_2d.vframes;
	sprite2D.hframes = sprite_2d.hframes;
	
	tween.tween_property(sprite2D, "modulate", Color(1,1,1,0), __fade_off_time);
