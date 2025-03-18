extends CharacterBody2D


var current_direction := "down"
var expression_manager: Node = GlobalNodes.expressions_manager

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
