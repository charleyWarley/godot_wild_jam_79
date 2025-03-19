class_name IdlePlayerState
extends PlayerState

const DECELERATION := 160

#starts in normal
#transitions to blink occasionally then back to normal after the blink animation finishes
#transitions to the sleep animation if the idle state has been active for a set amount of time
	#doesn't transition to blink while in sleep state

func check_relevance(input: InputPackage) -> String:
	input.actions.sort_custom(player_state_priority_sort)
	if input.actions[0] == "idle":
		return "continue"
	return input.actions[0]


func enter() -> void:
	var idle_animation_name : String = "idle_" + PLAYER.current_direction
	play_animation(idle_animation_name)


func physics_update(_input: InputPackage, _delta: float) -> void:
	if !ANIMATION_PLAYER.current_animation.ends_with(PLAYER.current_direction):
		play_animation("idle_" + PLAYER.current_direction)
	PLAYER.velocity.x = move_toward(PLAYER.velocity.x, 0, DECELERATION)
	PLAYER.velocity.y = move_toward(PLAYER.velocity.y, 0, DECELERATION)
	PLAYER.move_and_slide()
