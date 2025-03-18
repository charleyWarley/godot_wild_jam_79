class_name InputManager
extends Node

var new_input : InputPackage


func gather_input() -> InputPackage:
	new_input = InputPackage.new()
	
	check_action("interact")
	new_input.direciton_name = ""
	new_input.input_direction = Input.get_vector(
		"move_left", "move_right",
		"move_up", "move_down"
	)
	if new_input.input_direction != Vector2.ZERO:
		new_input.actions.append("walking")
	if new_input.actions.is_empty():
		new_input.actions.append("idle")
	
	return new_input


func check_action(action_name: String) -> void:
	if Input.is_action_just_pressed(action_name):
		new_input.actions.append(action_name + "ing")


		
	
