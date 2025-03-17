extends CharacterBody2D

#const ACCELERATION := 35
#const DECELERATION := 850

var current_direction := "down"

@onready var PLAYER_STATE_MANAGER := $PlayerStateManager
@onready var INPUT_MANAGER := $InputManager


func _process(delta: float) -> void:
	var input : InputPackage = INPUT_MANAGER.gather_input()
	PLAYER_STATE_MANAGER.update(input, delta)
	input.queue_free()


func _physics_process(delta: float) -> void:
	var input : InputPackage = INPUT_MANAGER.gather_input()
	PLAYER_STATE_MANAGER.physics_update(input, delta)
	input.queue_free()
#
	#var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	#set_direction_name(direction)
	
#

#func set_direction_name(direction: Vector2) -> void:

#
