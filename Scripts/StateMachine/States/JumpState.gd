class_name JumpState;
extends BaseState;

func _enter():
	super._enter();
	
	if character_2d.is_has_jumps() && !character_2d.is_jump_lock():
		character_2d._jump();
		ParticleCreator.CreateOneShot(self, load("res://Scenes/Subscenes/Particles/JumpParticles.tscn"), character_2d.__feet_point.global_position)
	
func _physics_update(delta):
	super._physics_update(delta);
	return state.FALL;

