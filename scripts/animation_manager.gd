extends Node

@export var ANIMATION_PLAYER : AnimationPlayer

func play_animation(animation_name: String) -> void:
	if ANIMATION_PLAYER.current_animation == animation_name:
		return
