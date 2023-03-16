extends BodyHandler;

func _on_body_entered(other):
	if(other is Character2D):
		other._death();
	
	super._on_body_entered(other);
