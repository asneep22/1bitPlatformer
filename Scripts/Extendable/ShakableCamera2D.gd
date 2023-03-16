class_name ShakableCamera2D;
extends Camera2D

func _ready():
	set_process(true)

func shake(duration: float, frequency: float, amplitude: float):
	var shake_time:float = duration / frequency;
	
	while duration > 0:
		await  get_tree().create_timer(shake_time).timeout;
		duration -= shake_time;
		
		var random_x = randf_range(-1, 1) * amplitude * duration;
		var random_y = randf_range(-1, 1) * amplitude * duration;
		
		set_offset(Vector2(random_x, random_y));
	

