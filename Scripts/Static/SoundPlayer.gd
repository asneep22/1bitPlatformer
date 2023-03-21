class_name SoundPlayer;

static func PlayOneShot(parent:Node2D, audio_stream:AudioStream, audio_bus: String, position: Vector2):
	var audio_stream_player_2d = AudioStreamPlayer2D.new();
	parent.add_child(audio_stream_player_2d);
	
	audio_stream_player_2d.global_position = position;
	audio_stream_player_2d.stream = audio_stream;
	audio_stream_player_2d.bus = audio_bus;
	audio_stream_player_2d.play();
	
	await  parent.get_tree().create_timer(audio_stream_player_2d.stream.get_length()).timeout;
	
	audio_stream_player_2d.queue_free();
	
static func PlayOneShotRandom(parent:Node2D, audio_stream:Array[AudioStream], audio_bus: String, position: Vector2):
	var index:int = randi() % audio_stream.size();
	PlayOneShot(parent, audio_stream[index], audio_bus, position);
