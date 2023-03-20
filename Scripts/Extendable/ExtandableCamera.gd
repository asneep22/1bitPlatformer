class_name ExtandableCamera;
extends Camera2D

@export var __move_duration: float = 1;
@export var __transitionType: Tween.TransitionType;
@export var __easeType: Tween.EaseType;

@onready var __audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer;
@export var _shake_volume_db = -25;

func _ready():
	set_process(true)

func shake(duration: float, frequency: float, amplitude: float) -> void:
	var shake_time:float = duration / frequency;
	
	__audio_stream_player.volume_db = _shake_volume_db;
	print(__audio_stream_player.volume_db);
	__audio_stream_player.play();
	
	while duration > 0:
		await  get_tree().create_timer(shake_time).timeout;
		duration -= shake_time;
		
		var random_x = randf_range(-1, 1) * amplitude * duration;
		var random_y = randf_range(-1, 1) * amplitude * duration;
		
		set_offset(Vector2(random_x, random_y));
		
func move_to(target: Node2D):
	var tween: Tween = get_tree().create_tween();
	tween.tween_property(self, "global_position", target.global_position, __move_duration).set_trans(__transitionType).set_ease(__easeType);
