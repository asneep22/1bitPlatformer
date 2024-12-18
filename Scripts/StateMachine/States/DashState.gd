class_name DashState;
extends BaseState;

@export_group("Dash")
@export var __dash_speed: float = 1450;
@export var __dash_time: float = .15;
@onready var __ghost_trail: GhostTrail = $"../../GhostTrail";
@onready var __current_dash_time: float = __dash_time;
@export var _audio_stream: AudioStream;

func _enter():
	character_2d.__audio_stream_player_2d.stream = _audio_stream;
	SoundPlayer.PlayOneShot(self, _audio_stream, character_2d.__audio_stream_player_2d.bus, global_position)
	super._enter();

func _physics_update(delta):
	__ghost_trail.create_sprite(character_2d._sprite_2d);

	__current_dash_time -= delta;
	character_2d.velocity.x = __dash_speed * (-1 if character_2d._sprite_2d.flip_h else 1);

	if (Input.is_action_just_pressed("attack")):
		return state.ATTACK;

	if __current_dash_time <= 0:
		__current_dash_time = __dash_time;
		return state.FALL;	
		
func _input_key(event):
	if event.is_action_pressed("attack"):
		return
