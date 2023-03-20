class_name ParticleCreator;

static func CreateOneShot(parent:Node2D, particle_packed_scene: PackedScene, position: Vector2):
	var life_timer_incctance = Timer.new();
	var particles_instance = particle_packed_scene.instantiate() as GPUParticles2D;
	
	parent.add_child(particles_instance);
	parent.add_child(life_timer_incctance);
	
	particles_instance.global_position = position;
	(particles_instance as GPUParticles2D).set_emitting(true);
	life_timer_incctance.timeout.connect(particles_instance.queue_free);
	life_timer_incctance.timeout.connect(life_timer_incctance.queue_free);
	life_timer_incctance.start(particles_instance.lifetime);
	
