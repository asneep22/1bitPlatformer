extends Character2DHandler;

func _kill(character2D: Character2D):
	
	character2D._death();
	print(character2D.name + "was killed by" + name);
