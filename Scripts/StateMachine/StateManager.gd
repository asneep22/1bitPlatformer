class_name StateManager;
extends Node

@onready var _states = {
	BaseState.state.IDLE: $IdleState,
	BaseState.state.RUN: $RunState,
	BaseState.state.JUMP: $JumpState,
	BaseState.state.FALL: $FallState,
	BaseState.state.DASH: $DashState,
	BaseState.state.WALL_SLIDE: $WallSlideState,
	BaseState.state.WALL_JUMP: $WallJumpState,
	BaseState.state.ATTACK: $AttackState,
	BaseState.state.DEATH: $FallState,
}

var __current_state: BaseState;

func change_state(new_state: int) -> void:
	if __current_state:
		__current_state._exit();
		
	__current_state = _states[new_state];
	__current_state._enter(	);
		
func init(character_2d: Character2D):
	for child in get_children():
		(child as BaseState).character_2d = character_2d;
		change_state(BaseState.state.IDLE);

	
func _physics_process(delta: float) -> void:
	var new_state = __current_state._physics_update(delta)
	if new_state:
		change_state(new_state)

func _input(event: InputEvent) -> void:
	var new_state = __current_state._input_key(event)
	if new_state:
		change_state(new_state)

#func _process(delta: float) -> void:
#	var new_state = __current_state.process(delta)
#	if new_state:
#		change_state(new_state)
