extends ColorRect

@export var PLAY_BUTTON : Button
@export var SETTINGS_BUTTON : Button

var button_index := 0


func _on_play_button_pressed() -> void:
	GlobalNodes.screen_manager.set_current_screen("foyer", Vector2(293, 204), "down")


func _on_settings_button_pressed() -> void:
	print("settings pressed")


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("move_down"):
		change_button_focus(1)
	elif Input.is_action_just_pressed("move_up"):
		change_button_focus(-1)
	elif Input.is_action_just_pressed("tab"): #added so tabbing through buttons doesn't mess up the button index
		change_button_focus(1, false)
	elif Input.is_action_pressed("shift") and Input.is_action_just_pressed("tab"):
		change_button_focus(-1, false)
	if Input.is_action_just_pressed("interact"):
		press_button()
	

func _ready() -> void:
	PLAY_BUTTON.grab_focus()
	connect_signals()


func press_button() -> void:
	match button_index:
		0: PLAY_BUTTON.emit_signal("pressed")
		1: SETTINGS_BUTTON.emit_signal("pressed")


func change_button_focus(direction: int, will_move_focus:=true) -> void:
	button_index += direction
	if button_index > 1: button_index = 0
	elif button_index < 0: button_index = 1
	if !will_move_focus: return
	match button_index:
		0: PLAY_BUTTON.grab_focus()
		1: SETTINGS_BUTTON.grab_focus()


func connect_signals() -> void:
	PLAY_BUTTON.connect("pressed", _on_play_button_pressed)
	SETTINGS_BUTTON.connect("pressed", _on_settings_button_pressed)
