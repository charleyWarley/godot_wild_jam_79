class_name WalkingPlayerState
extends PlayerState

const SPEED = 160.0


func check_relevance(input: InputPackage) -> String:
	input.actions.sort_custom(player_state_priority_sort)
	if input.actions[0] == "walking":
		return "continue"
	return input.actions[0]


func enter() -> void:
	play_animation("walk_" + PLAYER.current_direction)


func physics_update(input: InputPackage, _delta: float) -> void:
	if !ANIMATION_PLAYER.current_animation.ends_with(PLAYER.current_direction):
		play_animation("walk_" + PLAYER.current_direction)
	var direction := input.input_direction
	direction = direction.normalized()
	PLAYER.velocity = direction * SPEED
	PLAYER.move_and_slide()
