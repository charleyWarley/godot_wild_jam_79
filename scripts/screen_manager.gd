extends Node

const SCREENS := {
	"title_menu": preload("res://scenes/title_menu.tscn"),
	"area1": preload("res://scenes/level_area1.tscn"),
	"area2": preload("res://scenes/level_area2.tscn"),
	}

var current_screen : Node

@onready var MAIN_GUI := $"../MainGUI"
@onready var VIEWPORT := $"../SubViewportContainer/LevelViewport"


func _ready() -> void:
	current_screen = $"../SubViewportContainer/LevelViewport/TitleMenu"
	GlobalNodes.screen_manager = self


func set_current_screen(screen_name: String, player_position: Vector2, direction_name: String) -> void:
	if not screen_name in SCREENS: 
		push_warning("Level ", screen_name, " does not exist")
		return
	if screen_name != "title_menu":
		if !MAIN_GUI.visible: MAIN_GUI.visible = true
	else:
		if MAIN_GUI.visible: MAIN_GUI.visible = false
	current_screen.queue_free()
	current_screen = null
	var new_screen : Node2D = SCREENS[screen_name].instantiate()
	VIEWPORT.call_deferred("add_child", new_screen)
	current_screen = new_screen
	new_screen.call_deferred("set_player_position", player_position, direction_name)
