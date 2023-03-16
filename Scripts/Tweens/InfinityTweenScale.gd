extends TweenScale;

@export var __start_scale: Vector2 = Vector2(.65,.65);

func _ready():
	var tween: Tween = get_tree().create_tween();
	tween.tween_property(self, "scale", __start_scale, _duration / 2).set_trans(_transitionType).set_ease(_easeType);
	tween.tween_property(self, "scale", _end_scale, _duration / 2).set_trans(_transitionType).set_ease(_easeType);
	tween.set_loops();
