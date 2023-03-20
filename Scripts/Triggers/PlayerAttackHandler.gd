extends Character2DHandler;

func _ready():
	on_entered.connect(get_parent().queue_free);

func _on_body_entered(other: Node2D):
	print(other.name + " collided with " + name);

	if !other is Player:
		return;
		
	var player = (other as Player);
	
	print(player.get_last_slide_collision());
#	if player.state_manager.current_state == player.state_manager.states[BaseState.state.ATTACK]:
	on_entered.emit();
