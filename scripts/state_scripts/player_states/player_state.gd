class_name PlayerState
extends Node

var ANIMATION_PLAYER : AnimationPlayer
var PLAYER : CharacterBody2D
var current_direction : String

static var player_state_priority := {
	"idle": 1,
	"walk": 2,
	"interact": 3
}

#higher numbers are sorted as higher priority when multiple states are compared
static func player_state_priority_sort(a: String, b: String) -> bool:
	if player_state_priority[a] > player_state_priority[b]:
		return true
	else:
		return false


func check_relevance(_input: InputPackage) -> String:
	push_warning("implement the check_relevance function on move state")
	return "error"


func enter() -> void:
	pass

func update(_input: InputPackage, _delta: float) -> void:
	pass

func physics_update(_input: InputPackage, _delta: float) -> void:
	pass

func exit() -> void:
	pass


func play_animation(animation_name: String) -> void:
	if ANIMATION_PLAYER.current_animation == animation_name:
		return
	ANIMATION_PLAYER.play(animation_name)
