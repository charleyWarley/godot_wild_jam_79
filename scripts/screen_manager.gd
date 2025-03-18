extends Node

const SCREENS := {
	"title_menu": preload("uid://dgpd66jdxe4b3"),
	"foyer": preload("uid://mqeuqgx0io73"),
	"cafeteria": preload("uid://db6bms7uummap"),
	"garden": preload("uid://bufjyjef1lkxe"),
	"recreation": preload("uid://bc3nj2uecysjv"),
	}

@export var MAIN_GUI : CanvasLayer
@export var SCREEN_HOLDER : Control

var current_screen : Node


func _ready() -> void:
	current_screen = SCREEN_HOLDER.get_child(0)
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
	SCREEN_HOLDER.call_deferred("add_child", new_screen)
	current_screen = new_screen
	new_screen.call_deferred("set_player_position", player_position, direction_name)
