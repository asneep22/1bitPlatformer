class_name TweenModulate;
extends Node

@export var duration: float = 2.5;

signal on_start_fade_in;
signal on_end_fade_off;

func _ready():
	fade_off();

func fade_off():
	var tween: Tween = get_tree().create_tween();
	tween.tween_property(self, "modulate", Color(1,1,1,0), duration);
	tween.finished.connect(end_fade_off);
	
func fade_in():
	var tween: Tween = get_tree().create_tween();
	tween.tween_property(self, "modulate", Color(1,1,1,1), duration);
	on_start_fade_in.emit();
	
func end_fade_off():
	on_end_fade_off.emit();
