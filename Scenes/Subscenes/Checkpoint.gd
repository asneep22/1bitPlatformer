extends Area2D

func _on_body_entered(body: Node2D):
	if body is Player:
		(body as Player).update_checkpoint_position();
