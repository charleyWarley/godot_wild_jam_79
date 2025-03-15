extends ColorRect

@export var PLAY_BUTTON : Button
@export var SETTINGS_BUTTON : Button

@onready var SCREEN_MANAGER := $"../../../ScreenManager"

func _on_play_button_pressed() -> void:
	SCREEN_MANAGER.set_current_level("test")

func _on_settings_button_pressed() -> void:
	print("settings pressed")


func _ready() -> void:
	connect_signals()

func connect_signals() -> void:
	PLAY_BUTTON.connect("pressed", _on_play_button_pressed)
	SETTINGS_BUTTON.connect("pressed", _on_settings_button_pressed)
