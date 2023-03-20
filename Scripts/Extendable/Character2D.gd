class_name Character2D;
extends ExtendedCharacterBody2D

@onready var __audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D;
@onready var animation_player: AnimationPlayer = $AnimationPlayer;
@onready var _sprite_2d: Sprite2D = $Sprite2D;
@onready var _feet_point: Node2D = $Feet;

@export var __step_sounds: Array[AudioStream];
@export var __jump_sounds: Array[AudioStream];
@export var __attack_sounds: Array[AudioStream];

signal on_death;

func rotate_to_movement_direction(move_direction):
	if move_direction != 0:
		_sprite_2d.set_flip_h(move_direction < 0);

func _death():
	on_death.emit();
	
func _play_random_step_sound():
	var random_index: int = randi() % __step_sounds.size();
	__audio_stream_player_2d.stream = __step_sounds[random_index];
	__audio_stream_player_2d.play();
	
func _play_random_jump_sound():
	var random_index: int = randi() % __jump_sounds.size();
	__audio_stream_player_2d.stream = __jump_sounds[random_index];
	__audio_stream_player_2d.play();
	
func _play_random_attack_sound():
	var random_index: int = randi() % __attack_sounds.size();
	__audio_stream_player_2d.stream = __attack_sounds[random_index];
	__audio_stream_player_2d.play();
	
	
