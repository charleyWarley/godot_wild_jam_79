class_name InteractingPlayerState
extends PlayerState

const DECELERATION := 160

var can_transition := false #temporary variable until animation

func check_relevance(input: InputPackage) -> String:
	if !can_transition:
		return "continue"
	input.actions.sort_custom(player_state_priority_sort)
	return input.actions[0]


func enter() -> void:
	can_transition = false
	await get_tree().create_timer(0.3).timeout
	can_transition = true


func physics_update(_input: InputPackage, _delta: float) -> void:
	PLAYER.velocity.x = move_toward(PLAYER.velocity.x, 0, DECELERATION)
	PLAYER.velocity.y = move_toward(PLAYER.velocity.y, 0, DECELERATION)
	
	
