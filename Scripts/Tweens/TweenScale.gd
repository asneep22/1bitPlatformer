class_name TweenScale;
extends Node2D

@export var _end_scale: Vector2 = Vector2(.7,.7);
@export var _duration: float = 1;
@export var _transitionType : Tween.TransitionType;
@export var _easeType : Tween.EaseType;
@export var __is_increase: bool = true;

func _ready():
	if __is_increase:
		set_scale(Vector2(0,0));

func start():
	var tween: Tween = get_tree().create_tween();
	tween.tween_property(self, "scale", _end_scale, _duration).set_trans(_transitionType).set_ease(_easeType);
