class_name Player;
extends Character2D;

@onready var state_manager: StateManager = $StateManager;
@onready var attackRay: RayCast2D = $AttackRay;

func _ready():
	on_death.connect(__death)
	state_manager.init(self);
	
func _physics_process(delta):
	velocity.y += ProjectSettings.get_setting("physics/2d/default_gravity");
	move_and_slide();
	state_manager.physics_update(delta);
	
func _process(delta):
	state_manager.update(delta);
	
func __death():
	var is_in_death_state: bool = state_manager.current_state == state_manager.states[BaseState.state.DEATH];
	var is_in_respawn_state: bool = state_manager.current_state == state_manager.states[BaseState.state.RESPAWN];
	
	if !is_in_death_state && !is_in_respawn_state:	
		state_manager.change_state(BaseState.state.DEATH);
	
func update_checkpoint_position():
	(state_manager.states[BaseState.state.RESPAWN] as RespawnState).respawn_point = global_position;
